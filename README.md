<img src="images/netflixlogo.jpg" alt="Netflix Logo" width="50%"/>

# Project Background
Netflix has been seeing an increasing churn rate amongst their subscribers. The goal of the project is to find factors that lead to Netflix user churn rates using a given dataset on consumer information and interaction. Insights from identified churn rates and how they affect segmented groups will inform recommendations to the marketing team to target advertising campaigns to adhere to these with higher churn rates than others.

## Insights and Recommendations are provided on the following areas:

- **Churn Cause Analysis**: Determining and analyzing the outlying factors that cause a Netflix subscriber to cancel their subscription, pinpointing reasons that have the greatest churn cause in relation to group segments such as age, subscription type, and region. 
- **Subscription Price Analysis**: Using sales data from subsciption price per region and plan price to guide marketing decisions.
- **Customer Segmentation**: Grouping customers into certain groups based on age, subscription type, plan, and region and providing descriptive statistics on each group to make comparisons and inform targetted marketing strategies.

# Data Structure and Caveats

The data structure consists of two csv files: `netflix_user_data.csv` and `netflix_subscription_fee.csv`, containing data on netflix data based on individual, unnamed users and subscription fee based on country and plan type. The first table on user data was found on Kaggle, and synthesized to increase record count and provide data cleaning opportunities, and the subscription fee table retrieved from Kaggle contains information per country, a key that is changed to fit the user data table through SQL, data cleaning techniques can be found "here".

