# Credit Scoring Analysis and Modeling

## Overview
This project aims to develop a credit scoring model that can predict loan repayment likelihood for people without traditional banking histories. The model utilizes alternative data sources such as mobile usage and transactional data to assess creditworthiness.

## Motivation
Access to credit is a critical component of financial inclusion, but traditional credit scoring methods often exclude underbanked populations. By leveraging alternative data sources, this project explores new approaches to assess credit risk and expand financial access.

## Data Sources
The analysis integrates data from the following tables in a local MySQL database:

- `customers`: Demographic information for loan applicants
- `creditscorehistory`: Historical credit score data
- `loanapplications`: Loan application details and status
- `mobileusage`: Mobile usage metrics (data usage, call time)
- `transactions`: Customer transaction history

## Key Findings

### Demography Analysis
- The average income, age, and account age of customers vary significantly by country.
- The distribution of employment status differs across countries, with higher rates of self-employment and informal work.

### Transaction Analysis
- Customers exhibit diverse monthly spending patterns, with some maintaining consistent monthly spend and others showing high volatility.
- The project visualized monthly spending patterns to gain insights into financial behavior.

### Loan Application Analysis
- Loan approval rates vary by employment status, with higher rates for salaried employees compared to self-employed or informally employed applicants.
- The project visualized approval rates to identify high-risk applicant profiles.

### Credit Score Analysis
- The average credit score shows a downward trend over time, potentially indicating deteriorating creditworthiness.
- Tracking credit score changes can provide early warning signals for lenders.

### Mobile Usage Analysis
- There are correlations between mobile usage metrics (data usage, call time) and income, suggesting these alternative data sources may be useful for credit assessment.
- Further exploration of these relationships can uncover new predictive features.

## Credit Scoring Model
The project developed a credit scoring model using a Random Forest Classifier, achieving an accuracy of 60% on the test set.

![Credit Scoring Model Accuracy](https://via.placeholder.com/600x400)

The model was trained on features engineered from the dataset, including income, account age, employment status, and loan amount. Hyperparameter tuning was performed using GridSearchCV to optimize the model's performance.

## Future Improvements
1. **Enhance Feature Engineering**: Explore additional alternative data sources, such as mobile money transaction history, social media activity, and utility bill payments, to enrich the feature set.
2. **Improve Model Performance**: Experiment with other machine learning algorithms, such as XGBoost or LightGBM, and further optimize hyperparameters to increase the model's predictive accuracy.
3. **Incorporate Explainability**: Implement techniques like SHAP or LIME to provide insights into the relative importance of features and the model's decision-making process.
4. **Deploy to Production**: Integrate the credit scoring model into a production-ready application or API to enable real-time credit assessment for underbanked populations.

## Conclusion
This project demonstrates the potential of using alternative data sources and advanced analytics to develop credit scoring models that can better serve underbanked and underserved communities. The insights and model developed in this work can contribute to improving financial inclusion and access to credit for those who have traditionally been excluded from the formal financial system.
