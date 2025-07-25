<img src="images/netflixlogo.jpg" alt="Netflix Logo" width="50%"/>

# Project Background
Netflix has been seeing an increasing churn rate amongst their subscribers. The goal of the project is to find factors that lead to Netflix user churn rates using a given dataset on consumer information and interaction. Insights from identified churn rates and how they affect segmented groups will inform recommendations to the marketing team to target advertising campaigns to adhere to these with higher churn rates than others.

### Insights and Recommendations are provided on the following areas:

- **Churn Cause Analysis**: Determining and analyzing the outlying factors that cause a Netflix subscriber to cancel their subscription, pinpointing reasons that have the greatest churn cause in relation to customer segmentation.
- **Subscription Price Analysis**: Using sales data from subsciption price per region and plan price to guide marketing decisions.
- **Customer Segmentation**: Grouping customers into certain groups based on age, subscription type, plan, and region and providing descriptive statistics on each group to make comparisons and inform targetted marketing strategies.

### The following project deliverables will be provided:

- **Data Cleaning Notebook** for process reproducability and checking data integrity, including a documentation log on changes made and solutions to unfixable data issues, excel functions used, and a final cleaned excel file.
- **Analysis Notebook** to organize analysis, answer key business questions, and provide the step-by-step thought processes to found insights and recommendations.
- **A Tableau Dashboard** to visualize and present key findings to stakeholders, technical and non-technical, in an interactive way.

# Data Structure and Caveats

The data structure consists of two csv files: `netflix_user_data.csv` and `country_sub_fee.csv`, containing data on netflix data based on individual, unnamed users and subscription fee based on country and plan type. The first table on user data was found on Kaggle, and synthesized to increase record count to resemble uncleaned business data, and the subscription fee table retrieved from Kaggle contains information per country, a key that is changed to fit the user data table through SQL.

In project relation, following the given task of analyzing customer churn reasons and sale data to guide marketing decisions, I retrieved the information on user data from the Customer data sector, and the subscription fee prices for countries from the revenue sector. 

<img src="images/Model databases (1).png" alt="netflix_database" width="100%"/>

Data cleaning efforts, added columns, and validation checks were conducted to ensure data was ready for analysis. Those processes are outlined <a href="Netflix-Churn-Project/notebooks
/data_cleaning_notebook.md">here</a>. The formulas for such cleaning efforts can also be found <a href="Netflix-Churn-Project/excel
/excel_formulas.md">here</a>.

# Executive Summary

