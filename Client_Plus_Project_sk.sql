                                                 # CREATING THE DATABASE AND IMPORT TABLE 

create database Client_Plus;
use Client_Plus;
show tables;
select * from credit_card_churn;
                                                   # CLEANING THE DATA
                                                   

# standerdize columns 
ALTER TABLE credit_card_churn RENAME COLUMN Attrition_Flag to customer_status,
RENAME COLUMN Dependent_count to Family_members,
RENAME COLUMN Total_Relationship_Count to no_of_bank_product_with_customer,
RENAME COLUMN Months_Inactive_12_mon to Months_Inactive,
RENAME COLUMN Avg_Open_To_Buy to unused_balance,
RENAME COLUMN Contacts_Count_12_mon to Contacts_Count;
    
 select * from credit_card_churn;
 
 # checking for duplicates  duplicates 
 
SELECT CLIENTNUM, COUNT(*) as duplicate_count FROM credit_card_churn
GROUP BY CLIENTNUM
HAVING COUNT(*) > 1;                # we dont have any duplicate values in data 


 # Handing null values in each column  
 SELECT 
  SUM(CASE WHEN Customer_Age IS NULL THEN 1 ELSE 0 END) AS null_column1,
  SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS null_column2,
  SUM(CASE WHEN Family_members IS NULL THEN 1 ELSE 0 END) AS null_column2,
  SUM(CASE WHEN Education_Level IS NULL THEN 1 ELSE 0 END) AS null_column2,
  SUM(CASE WHEN Marital_Status IS NULL THEN 1 ELSE 0 END) AS null_column2,
  SUM(CASE WHEN Income_Category IS NULL THEN 1 ELSE 0 END) AS null_column2,
  SUM(CASE WHEN Card_Category IS NULL THEN 1 ELSE 0 END) AS null_column2,
SUM(CASE WHEN Tenure IS NULL THEN 1 ELSE 0 END) AS null_column2,
SUM(CASE WHEN Months_on_book IS NULL THEN 1 ELSE 0 END) AS null_column2,
SUM(CASE WHEN no_of_bank_product_with_customer IS NULL THEN 1 ELSE 0 END) AS null_column2,
SUM(CASE WHEN Months_Inactive IS NULL THEN 1 ELSE 0 END) AS null_column2,
SUM(CASE WHEN Contacts_Count IS NULL THEN 1 ELSE 0 END) AS null_column2,
SUM(CASE WHEN Credit_Limit IS NULL THEN 1 ELSE 0 END) AS null_column2,
SUM(CASE WHEN Total_Revolving_Bal IS NULL THEN 1 ELSE 0 END) AS null_column2,
SUM(CASE WHEN Total_Amt_Chng_Q4_Q1 IS NULL THEN 1 ELSE 0 END) AS null_column2,
SUM(CASE WHEN Total_Trans_Amt IS NULL THEN 1 ELSE 0 END) AS null_column2,
SUM(CASE WHEN Total_Trans_Ct IS NULL THEN 1 ELSE 0 END) AS null_column2,
SUM(CASE WHEN Total_Ct_Chng_Q4_Q1 IS NULL THEN 1 ELSE 0 END) AS null_column2,
SUM(CASE WHEN Churn_Flag IS NULL THEN 1 ELSE 0 END) AS null_column2,
SUM(CASE WHEN Avg_Utilization_Ratio IS NULL THEN 1 ELSE 0 END) AS null_column2
FROM credit_card_churn;                                                           # we dont have any null values 


# filter out invalid values 
set sql_safe_updates = 0;
delete from credit_card_churn where Customer_Age < 0 or Customer_Age >110
and Family_members >20 ;


# droping the unwanted columns
ALTER TABLE credit_card_churn                      
DROP COLUMN CLIENTNUM;


                                                            # Customer Demographics & Overview
                                                            
                                                
#Q1 How many total customers are there?
SELECT COUNT(*) AS total_customers FROM credit_card_churn;         #10000

#Q2 What is the churn rate overall?
SELECT ROUND(SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM credit_card_churn;
                                                     # the churn rate is  high it's 15.88% so this company is in danger 
                                                     
#Q3 Churn rate by gender
 SELECT Gender,  COUNT(*) AS total_customers,
  SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) AS churned,
  ROUND(SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM credit_card_churn
GROUP BY Gender;

/* 
        total_customers  churned  churn_rate_percent
Male 	    4684	         673    	14.37
Female	    5316	         915	    17.21       */          # female are likely to chunk more 

 
 
 #Q3 churn rate by education 
 SELECT Education_Level,
  COUNT(*) AS total,
  SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) AS churned,
  ROUND(SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM credit_card_churn
GROUP BY Education_Level
ORDER BY churn_rate_percent DESC;

 /* 
Education_Level  total    churned   churn_rate_percent

Doctorate	      444	    92	            20.72
Post-Graduate	  514	    91	            17.70
Unknown	          1505	    250	            16.61
Uneducated	      1470	    233	            15.85
Graduate	      3079	    475	            15.43                       -- Educated people churn more 
 */                                                              
 
                                                               # Behavioral Insights 
                                                               
 
 #Q4 Average transaction amount change between churned and retained customers
SELECT customer_status,
ROUND(AVG(Total_Amt_Chng_Q4_Q1), 2) AS avg_transaction_change
FROM credit_card_churn
GROUP BY customer_status;
 
# Existing Customer	-- 0.77
# Attrited Customer	-- 0.69
 
 
 #Q5  Do inactive customers tend to churn more 
 CREATE VIEW inactive_customers_churn_status AS 
 SELECT  Months_Inactive,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) AS churned_customers
FROM credit_card_churn
GROUP BY Months_Inactive
ORDER BY Months_Inactive; 

 select * FROM inactive_customers_churn_status;                 # yes
 
 
 #Q6  Churn rate by number of contacts with customer service 
 SELECT Contacts_Count,
COUNT(*) AS total,
SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM credit_card_churn
GROUP BY Contacts_Count
ORDER BY churn_rate DESC;

 /* 
months     churn rate
6            22.05
5            19.90
4             12.46
3             7.21
2             12.46
1             7.21 
0             1.77
                                 */ 
                                 
                                                               #  Financial Insights
                                                               
                                 
 #Q7  Compare avg credit limit of churned vs retained customers
 SELECT customer_status,
ROUND(AVG(Credit_Limit), 2) AS avg_credit_limit
FROM credit_card_churn
GROUP BY  customer_status;

 /*   
 Existing Customer -- 8683.66  avg_credit_limit
 Attrited Customer -- 8034.41  avg_credit_limit
*/ 
                        
                        
# Q8 Top 5 card categories with highest churn rate
SELECT Card_Category,
COUNT(*) AS total_customers,
SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM credit_card_churn
GROUP BY Card_Category
ORDER BY churn_rate DESC
LIMIT 5;

/*  

Card_Category   total_customers  churned    churn_rate                  most people churn in blue card and percentage wise in gold card 
Platinum	      20	            5	      25.00
Gold	          111	            20	      18.02
Blue	          9335	           1488	      15.94
Silver	          534	            75	      14.04

*/ 


# Q9 Does higher avg unused_balance reduce churn?
SELECT CASE 
WHEN unused_balance < 1000 THEN 'Low'
WHEN unused_balance BETWEEN 1000 AND 5000 THEN 'Medium'
ELSE 'High'
END AS open_to_buy_segment,
COUNT(*) AS total, SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM credit_card_churn
GROUP BY unused_balance ;                   # NO  higher avg unused_balance does not reduce churn
         

#Q10   Which customer segment (age + income) has highest churn?
SELECT Income_Category,
CASE 
    WHEN Customer_Age < 30 THEN 'Young'
    WHEN Customer_Age  BETWEEN 30 AND 50 THEN 'Adult'
    ELSE 'Senior'
END AS age_group,
COUNT(*) AS total,
SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN customer_status = "Attrited Customer" THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM credit_card_churn
GROUP BY Income_Category, age_group
ORDER BY churn_rate DESC;                                  # young with $120K +  and young with $60K - $80K have  highest churn rate ( 33 and 20 percent )




 
 
 
 
 
 
 
 
 






