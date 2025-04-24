# Client Plus – Credit Card Customer Churn Prediction 

# Overview

Customer churn is a major concern for financial institutions, especially in competitive sectors like credit card services. This project aims to build a machine learning pipeline that predicts the likelihood of a customer churning (closing their credit card account), enabling the company to take proactive retention actions.

[![Image](https://github.com/KUKRETI07/Client_plus/blob/bc1ba1a9311e60a6cadd85b790ed9191054e6f37/Screenshot%20(61).png)

# Problem Statement

A financial institution wants to reduce losses from customers closing their credit cards. Your goal is to analyze customer behavior, identify churn patterns, and build a predictive model that accurately flags high-risk customers.

# Tools & Technologies

* Languages: Python, SQL (MySQL)

* Libraries: Pandas, NumPy, Scikit-learn, Matplotlib, Seaborn

* ML Models: Logistic Regression, SVM, KNN, Random Forest, XGBoost

* BI Tool: Power BI (DAX, Slicers, KPIs)

* Other: Jupyter Notebook, Git, GitHub

# Dataset

* Customer information and usage patterns (credit limit, transaction amount, contact count, months inactive, etc.)

# Process

1. Data Cleaning

* Removed duplicates and handled null values

* Standardized column formats

* Cleaned using SQL queries (JOIN, GROUP BY, HAVING, Filtering)

2. Exploratory Data Analysis (EDA)

* Identified churn trends based on card category, contact count, tenure, and inactivity

* Plotted distributions, correlations, and pair plots to explore relationships

3. Feature Engineering

* Created interaction features (e.g., contact-to-churn ratio, total transaction avg)

* Handled outliers using IQR

* Applied PCA to reduce dimensionality and improve model performance

4. Model Building & Evaluation

* Trained 5 classification models

* Best Model: Support Vector Machine (SVM)

* Tuned hyperparameters using GridSearchCV

* Evaluated with:

* Accuracy: 91.5%

* Cross-Validation Score: 90%

* Confusion Matrix, Classification Report, ROC Curve

5. Power BI Dashboard

* Built an interactive dashboard with:

* KPIs: Churn Rate, Contact Count, Tenure, Card Category

* Filters for gender, education level, card type

* DAX measures and clean layout for business use

 #  Final Insights

* Customers with >4 inactive months and <3 contact counts are highly likely to churn

* Most churned users held basic "Blue" card tier

* Customers with lower available credit showed higher churn risk

# Model App Link

https://clientplus-wckiuuaxxk6wix5ieeyshq.streamlit.app/
