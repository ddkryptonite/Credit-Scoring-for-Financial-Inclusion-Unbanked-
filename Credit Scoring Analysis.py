#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
from sqlalchemy import create_engine


# In[2]:


#Connecting to MySQL database
username = "root",
password = "Danieledem_7",
host = "localhost",
database = "creditscoringafrica"


# In[3]:


engine = create_engine(f"mysql+mysqlconnector://{'root'}:{'Danieledem_7'}@{'localhost'}/{'creditscoringafrica'}")


# In[12]:


# Use pandas with the SQLAlchemy engine

customers_df = pd.read_sql("SELECT * FROM customers", engine)
creditscorehistory_df = pd.read_sql("SELECT * FROM creditscorehistory", engine)
loanapplications_df = pd.read_sql("SELECT * FROM loanapplications", engine)
mobileusage_df = pd.read_sql("SELECT * FROM mobileusage", engine)
transactions_df = pd.read_sql("SELECT * FROM transactions", engine)


# In[7]:


print(customers_df.head())


# ### Data Cleaning

# In[16]:


#Checking for missing values

print(customers_df.isnull().sum())
print(creditscorehistory_df.isnull().sum())
print(loanapplications_df.isnull().sum())
print(mobileusage_df.isnull().sum())
print(transactions_df.isnull().sum())

#Converting data to date time
transactions_df['TransactionDate'] = pd.to_datetime(transactions_df['TransactionDate'])
mobileusage_df['DateRecorded'] = pd.to_datetime(mobileusage_df['DateRecorded'])
loanapplications_df['ApplicationDate'] = pd.to_datetime(loanapplications_df['ApplicationDate'])
creditscorehistory_df['DateUpdated'] = pd.to_datetime(creditscorehistory_df['DateUpdated'])


# ### Demography Analysis

# In[9]:


#Statistics by Country

print(customers_df.groupby('Country')[['Income', 'Age', 'AccountAge']].describe())

#Distribution of Employment Status by Country

employment_dist = customers_df.groupby(['Country', 'EmploymentStatus']).size().unstack()
employment_dist.plot(kind= 'bar', stacked=True, title='Employment Status by Country')


# ### Transaction Analysis

# In[10]:


# Monthly total transaction amount for each customer
transactions_df['Month'] = transactions_df['TransactionDate'].dt.to_period('M')
monthly_transactions = transactions_df.groupby(['CustomerID', 'Month'])['Amount'].sum().unstack(fill_value=0)
print(monthly_transactions.head())

# Visualize spending patterns
monthly_transactions.T.plot(title="Monthly Spending Patterns per Customer")


# ### Loan Application Analysis

# In[13]:


# Approval rates by EmploymentStatus
approval_rates = loanapplications_df.merge(customers_df, on='CustomerID')
approval_rate_by_employment = approval_rates.groupby('EmploymentStatus')['Status'].value_counts(normalize=True).unstack().fillna(0)
print(approval_rate_by_employment)

# Visualize approval rates
approval_rate_by_employment.plot(kind='bar', stacked=True, title="Loan Approval Rate by Employment Status")


# ### Credit Score Analysis

# In[17]:


# Average credit score by month
creditscorehistory_df['Month'] = creditscorehistory_df['DateUpdated'].dt.to_period('M')
avg_credit_score_by_month = creditscorehistory_df.groupby('Month')['Score'].mean()
avg_credit_score_by_month.plot(title="Average Credit Score Over Time")


# ###  Mobile Usage Analysis : correlations between mobile usage (data and call time) and financial behaviors.

# In[18]:


# Correlation between MonthlyDataUsage, AverageMonthlyCalls, and Income
mobile_usage_stats = mobileusage_df.merge(customers_df, on='CustomerID')
correlation = mobile_usage_stats[['MonthlyDataUsage', 'AverageMonthlyCalls', 'Income']].corr()
print("Correlation matrix:\n", correlation)


# ### Modeling the Credit Scoring System with Random Forest

# In[30]:


from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score

# Feature Engineering
features = approval_rates[['Income', 'AccountAge', 'EmploymentStatus', 'LoanAmount']]
features = pd.get_dummies(features, drop_first=True)  # Encode categorical variables
target = (approval_rates['Status'] == 'Approved').astype(int)  # Binary target for loan approval

# Splitting the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(features, target, test_size=0.3, random_state=42)

# Train a Random Forest Classifier
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Evaluate the model
y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print(f"Model Accuracy: {accuracy * 100:.2f}%")


# ## Hyperparameter Tuning for better accuracy

# In[20]:


from sklearn.model_selection import GridSearchCV
from sklearn.metrics import accuracy_score


# In[21]:


model = RandomForestClassifier(random_state=42)

# Define the grid of hyperparameters to search
param_grid = {
    'n_estimators': [50, 100, 200],          # Number of trees
    'max_depth': [None, 10, 20, 30],         # Maximum depth of each tree
    'min_samples_split': [2, 5, 10],         # Minimum samples to split an internal node
    'min_samples_leaf': [1, 2, 4],           # Minimum samples at each leaf node
    'max_features': ['auto', 'sqrt', 'log2'] # Number of features to consider at each split
}


# In[24]:


# Setting up GridSearchCV with 5-fold cross-validation
grid_search = GridSearchCV(estimator=model, param_grid=param_grid, cv=3, scoring='accuracy', n_jobs=-1, verbose=2)


# In[25]:


# Fitting the grid search to your data
grid_search.fit(X_train, y_train)


# In[ ]:




