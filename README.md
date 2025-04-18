# Client_plus

Project Overview : 
Customer churn prediction is crucial for businesses like banks and credit institutions that need to retain customers. By predicting which customers are likely to leave, businesses can take proactive steps to improve customer experience and reduce losses. In this project, I have applied various data analysis, machine learning, and data visualization techniques to build a churn prediction model for customers using credit cards and loans.

Objectives:
* Predict customer churn using historical data of customers credit card.

* Identify the key features influencing customer churn.

* Visualize the insights using Power BI.

* Build an interactive and intuitive dashboard for decision-making.

Dataset
The dataset used in this project contains customer transaction details, demographics, and behavior over a period of time. Key columns include:

* Customer_ID: Unique identifier for each customer.

* Credit_Limit: The total credit limit of the customer.

* Avg_Open_To_Buy: Average amount available for spending.

* Total_Trans_Amt: Total transaction amount in the last 12 months.

* Months_Inactive_12_Months: Number of months the customer has been inactive in the last 12 months.

* Attrition_Flag: Label for customer churn (1 = churned, 0 = active).

Tools & Technologies
This project uses a variety of tools and technologies to clean, analyze, and predict customer churn.

* Python Libraries: pandas, numpy, matplotlib, seaborn, sklearn, xgboost, tensorflow

* SQL: Data preprocessing and querying for data extraction.

* Power BI: For building the interactive dashboard and visualizations.

* Jupyter Notebook: For running Python scripts and analysis.

* Data Preprocessing & Cleaning
  
 Steps performed:
   
1. Handling Missing Values

2. Checked and handled missing values using imputation or removal where necessary.

3. Outlier Detection & Removal: Detected outliers using statistical methods (Z-score, IQR) and removed or adjusted them for model training.

4. Feature Transformation: Converted categorical variables (e.g., Gender, Education_Level) into numeric form using one-hot encoding or label encoding.

5. Normalization: Applied Min-Max scaling to normalize numerical features like Credit_Limit, Total_Trans_Amt, etc.
   
6. Churn Label Creation: Created the churn label from the Attrition_Flag column, with 1 representing churned customers and 0 representing active customers.
   
 Exploratory Data Analysis (EDA)
   
  * Key Insights from EDA:
    
    *  Customer Demographics: Most of the churned customers were from certain age groups and had lower credit limits.

    *  Transaction Patterns: Churned customers had fewer transactions in the past 12 months.

    *  Inactive Customers: A higher number of months of inactivity led to higher churn rates.

8. Visualizations:

 *  Churn Rate by Gender

 * Churn Rate by Education Level

 * Churn Rate by Credit Limit

 * Churn Rate vs Transaction Amount

 * Monthly Churn Trends (Line Chart)

( The full code and visualizations can be found in the EDA notebook. )

* Feature Engineering
  
    Steps performed:
     1.  Date-based Features: Extracted features like the Months_Inactive_12_Months, indicating inactivity duration.

     2. Aggregated Customer Behavior: Calculated average spending and transaction frequency for customers. 

     3. Interaction Features: Combined existing features like Credit_Limit and Total_Trans_Amt to create new features showing financial engagement.

     4. Encoding Categorical Data: Used One-Hot Encoding for categorical features like Gender and Education_Level. 

* Model Training & Evaluation
  
 1. Models Used: Logistic Regression (LR): Baseline model for classification.

 2. Support Vector Machine (SVM): Used for its effectiveness in high-dimensional spaces.

 3. K-Nearest Neighbors (KNN): Applied to measure similarity between customers.

 4. Random Forest (RF): Used for feature importance and high accuracy.

 5. XGBoost: A powerful boosting algorithm that performs well on classification tasks.

* Model Performance: Logistic Regression: 0.95 ROC AUC
  
  1. SVM: 0.97 ROC AUC (best performing model)

  2. KNN: 0.89 ROC AUC

       * Random Forest: Overfitted, discarded

       * XGBoost: Overfitted, discarded

 Power BI Dashboard
 
  * The Power BI Dashboard provides interactive visuals for business decision-making.
     
  * KPIs: Total Customers , Churned Customers , Churn Rate (calculated as Churned Customers / Total Customers) , Avg Credit Limit of Churned vs Active Customers

  * Visualizations: Churn Rate by Gender , Churn Rate by Education Level , Churn Rate by Credit Limit , Churn vs Transaction Amount (Bar and scatter plots)

 Insights & Recommendations (Based on the model and EDA)
  
   * Inactivity is a major driver of churn: Customers who have been inactive for several months are more likely to churn.

   * Low credit limits lead to higher churn: Customers with low credit limits are more likely to churn, suggesting that increasing the credit limit may improve retention.

   * Targeted Campaigns: Financial institutions should focus retention campaigns on customers with low transaction activity and higher months of inactivity.

 Future Improvements: 
   * Improve Model Performance: By tuning hyperparameters for models like Random Forest and XGBoost, we could improve accuracy.

   * Incorporate More Data: Additional data points such as customer interactions, payment history, etc., could help in further improving churn predictions.

   * Real-Time Prediction: Implement real-time prediction of churn using streaming data from the bank.
