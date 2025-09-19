<img src="images/netflixlogo.jpg" alt="Netflix Logo" width="50%"/>

# Project Background
Netflix has been seeing an increasing churn rate amongst their subscribers. The goal of the project is to find factors that lead to Netflix user churn rates using a given dataset on consumer information and interaction. Insights from identified churn rates and how they affect segmented groups will inform recommendations to the marketing team to target advertising campaigns to adhere to these with higher churn rates than others.

### Insights and Recommendations are provided on the following areas:

- **Customer Segmentation**: Grouping customers into certain groups dataset columns and providing descriptive statistics on each group to make comparisons and inform targetted marketing strategies.
- **Churn Cause Analysis**: Determining and analyzing the outlying factors that cause a Netflix subscriber to cancel their subscription, pinpointing reasons that have the greatest churn cause in each customer segment.
- **Subscription Price Analysis**: Using sales data from subsciption price per region and plan price to guide marketing decisions.

### The following project deliverables will be provided:

- **Data Cleaning Notebook** for process reproducability and checking data integrity, including a documentation log on changes made and solutions to unfixable data issues, excel functions used, and a final cleaned excel file.
- **Analysis Notebook** to organize analysis, answer key business questions, and provide the step-by-step thought processes to found insights and recommendations.
- **A Tableau Dashboard** to visualize and present key findings to stakeholders, technical and non-technical, in an interactive way.

# Executive Summary

This project analyzes customer churn patterns to identify factors influencing retention, as well as using plan pricing data to determine overall revenue. Throughout analysis, customer segmentation aims to help inform the marketing team on valuable customer segments in terms of subscription retention. To answer the business questions, two datasets were supplemented: `netflix_user_data.csv` and `country_sub_fee.csv`. `Netflix_user_data.csv` contains information on over 110,000 unique customers, including region, months subscribed, churn status, etc. `Country_sub_fee` contained information on each country with access to netflix, along with prices for each of their plans in USD, data which is later aggregated into a single table with regional average subscription prices to be joined with `netflix_user_data`. A total of three tools were used to conduct the project from start to finish: Excel for Data Cleaning efforts, SQL for Analysis efforts and EDA, and Tableau for a finalized dashboard and any accompanying visualizations for non-stakeholders.

<img src="images/Model databases (1).png" alt="netflix_database" width="100%"/>

During analysis, a few key insights included the following:

- Churn rate decreases by almost ~10% by the time new subscribers reached the one year benchmark.
- Age has a significant impact on retention, in both churn rate and subscription length duration.
- Churn rate increase by almost ~7% between 0 - 10 support queries logged

Further explanation on these insights and others are in the "Insight Deep-Dive" section below. Following deep diving into insights, recommendations are formed based on those insights and project next steps.

# Insight Deep-Dive

## Churn Cause Analysis

#### Relevant business questions: Q1, Q2



