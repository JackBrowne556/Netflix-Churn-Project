-- Question 2, see .md file for details

-- Subscription Length (Months)

/*
	Purpose: 
		Calculate churn by sub length category
		(1 ,3 ,6 ,12 ,24).

	Notes:
		- Relevent column for analysis is churn_rate, proportion of churned customers to total customers
		- Rounded to 4 decimals for readability. 
		- Uses previous numbers from Question 1 through churn_yes column
*/

WITH churn_by_length AS (
SELECT
  "sub_length" AS sub_length,	-- Subscription Length Categories (1, 3, 6, 12, 24)
  COUNT(*) AS total_customers,	-- Total Customers with each sub length
  SUM(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END) AS churn_yes, -- number of churned customers
  ROUND(
  	AVG(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END)::DECIMAL,
	4
)	AS churn_rate -- Proportion of churned customers to total customers in category
FROM netflix_user_data
GROUP BY "sub_length" -- Aggregate at subscription length
)
SELECT
	sub_length,
	churn_rate,
	/* Absolute value lagged difference between each category, multiplied by 100 for % accuracy. */
	ABS(churn_rate - LAG(churn_rate) OVER (ORDER BY sub_length)) * 100 AS churn_diff_percent
FROM
	churn_by_length
ORDER BY 
	sub_length


-- Region

/*
	Purpose: 
		Calculate churn by region
		(North America, South America, Europe, Asia, Africa).

	Notes:
		- Relevent column for analysis is churn_rate, proportion of churned customers to total customers
		- Rounded to 4 decimals for readability. 
		- Uses previous numbers from Question 1 through churn_yes column
*/

WITH churn_by_region AS (
SELECT
  "region" AS region,	-- Regions (North America, South America, Europe, Asia, Africa)
  COUNT(*) AS total_customers,	-- Total Customers for each region
  SUM(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END) AS churn_yes, -- number of churned customers
  ROUND(
  	AVG(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END)::DECIMAL,
	4
)	AS churn_rate -- Proportion of churned customers to total customers in category
FROM netflix_user_data
GROUP BY "region" -- Aggregate at region
)
SELECT
	region,
	churn_rate,
	/* Absolute value lagged difference between each category, multiplied by 100 for % accuracy. */
	ABS(churn_rate - LAG(churn_rate) OVER (ORDER BY region)) * 100 AS churn_diff_percent
FROM
	churn_by_region
ORDER BY 
	region

-- Subscription Plan Type

/*
	Purpose: 
		Calculate churn by plan type
		(Basic, Standard, Premium)
	Notes:
		- Relevent column for analysis is churn_rate, proportion of churned customers to total customers
		- Rounded to 4 decimals for readability. 
		- Uses previous numbers from Question 1 through churn_yes column
*/

WITH churn_by_plan AS (
SELECT
  "sub_plan" AS sub_plan,	-- Subscription Plan (Basic, Standard, Premium)
  COUNT(*) AS total_customers,	-- Total Customers for each sub_plan
  SUM(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END) AS churn_yes, -- number of churned customers
  ROUND(
  	AVG(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END)::DECIMAL,
	4
)	AS churn_rate -- Proportion of churned customers to total customers in category
FROM netflix_user_data
GROUP BY "sub_plan" -- Aggregate at sub_plan
)
SELECT
	sub_plan,
	churn_rate,
	/* Absolute value lagged difference between each category, multiplied by 100 for % accuracy. */
	ABS(churn_rate - LAG(churn_rate) OVER (ORDER BY sub_plan)) * 100 AS churn_diff_percent
FROM
	churn_by_plan
ORDER BY -- ORDER BY churn_rate for proper viewing
	churn_rate


-- Support Queries Logged

/*
	Purpose: 
		Calculate churn by number of support queries
		(1 - 10)
	Notes:
		- Relevent column for analysis is churn_rate, proportion of churned customers to total customers
		- Rounded to 4 decimals for readability. 
		- Uses previous numbers from Question 1 through churn_yes column
*/

WITH churn_by_support_query AS (
SELECT
  "support_queries_logged" AS support_queries_logged,	-- Support Queries Logged
  COUNT(*) AS total_customers,	-- Total Customers for each query group
  SUM(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END) AS churn_yes, -- number of churned customers
  ROUND(
  	AVG(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END)::DECIMAL,
	4
)	AS churn_rate -- Proportion of churned customers to total customers in category
FROM netflix_user_data
GROUP BY "support_queries_logged" -- Aggregate at query #
)
SELECT
	support_queries_logged,
	churn_rate,
	/* Absolute value lagged difference between each category, multiplied by 100 for % accuracy. */
	ABS(churn_rate - LAG(churn_rate) OVER (ORDER BY support_queries_logged)) * 100 AS churn_diff_percent
FROM
	churn_by_support_query
ORDER BY -- ORDER BY churn_rate for proper viewing
	support_queries_logged



-- Age

/*
	Purpose: 
		Calculate churn by Age Group
		(19-31, 32-44, 45-57, 58-70)
	Notes:
		- Relevent column for analysis is churn_rate, proportion of churned customers to total customers
		- Rounded to 4 decimals for readability. 
		- Uses previous numbers from Question 1 through churn_yes column
*/

WITH churn_by_age AS (
SELECT
     CASE
      WHEN age BETWEEN 18 AND 30 THEN '18-30'
      WHEN age BETWEEN 31 AND 43 THEN '31-43'
      WHEN age BETWEEN 44 AND 56 THEN '44-56'
      WHEN age BETWEEN 57 AND 69 THEN '57-69'
    END AS age_group,  -- Age Groups
  COUNT(*) AS total_customers,	-- Total Customers for each Age Group
  SUM(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END) AS churn_yes, -- number of churned customers
  ROUND(
  	AVG(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END)::DECIMAL,
	4
)	AS churn_rate -- Proportion of churned customers to total customers in category
FROM netflix_user_data
GROUP BY "age_group" -- Aggregate at age groups
)
SELECT
	age_group,
	churn_rate,
	/* Absolute value lagged difference between each category, multiplied by 100 for % accuracy. */
	ABS(churn_rate - LAG(churn_rate) OVER (ORDER BY age_group)) * 100 AS churn_diff_percent
FROM
	churn_by_age
ORDER BY
	age_group



-- Promotional Offers Used 

/*
	Purpose: 
		Calculate churn by Promotional Offers Used
		(0-1, 2-3, 4-5)
	Notes:
		- Relevent column for analysis is churn_rate, proportion of churned customers to total customers
		- Rounded to 4 decimals for readability. 
		- Uses previous numbers from Question 1 through churn_yes column
*/

WITH churn_by_offers_group AS (
SELECT
     CASE
      WHEN offers_used BETWEEN 0 AND 1 THEN '0-1'
      WHEN offers_used BETWEEN 2 AND 3 THEN '2-3'
      WHEN offers_used BETWEEN 4 AND 5 THEN '4-5'
    END AS offers_used_group,  -- Age Groups
  COUNT(*) AS total_customers,	-- Total Customers for each Promotional Offers Used Group
  SUM(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END) AS churn_yes, -- number of churned customers
  ROUND(
  	AVG(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END)::DECIMAL,
	4
)	AS churn_rate -- Proportion of churned customers to total customers in category
FROM netflix_user_data
GROUP BY "offers_used_group" -- Aggregate at offers used
)
SELECT
	offers_used_group,
	churn_rate,
	/* Absolute value lagged difference between each category, multiplied by 100 for % accuracy. */
	ABS(churn_rate - LAG(churn_rate) OVER (ORDER BY offers_used_group)) * 100 AS churn_diff_percent
FROM
	churn_by_offers_group
ORDER BY
	offers_used_group


-- Number of Profiles Created

/*
	Purpose: 
		Calculate churn by Number of Profiles Created
		(1-5)
	Notes:
		- Relevent column for analysis is churn_rate, proportion of churned customers to total customers
		- Rounded to 4 decimals for readability. 
		- Uses previous numbers from Question 1 through churn_yes column
*/

WITH churn_by_num_profiles_created AS (
SELECT
  "num_profiles_created" AS num_profiles_created,	-- Number of Profiles Created
  COUNT(*) AS total_customers,	-- Total Customers for each query group
  SUM(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END) AS churn_yes, -- number of churned customers
  ROUND(
  	AVG(CASE WHEN "churn_status" = 'Yes' THEN 1 ELSE 0 END)::DECIMAL,
	4
)	AS churn_rate -- Proportion of churned customers to total customers in category
FROM netflix_user_data
GROUP BY "num_profiles_created" -- Aggregate at number of profiles created
)
SELECT
	num_profiles_created,
	churn_rate,
	/* Absolute value lagged difference between each category, multiplied by 100 for % accuracy. */
	ABS(churn_rate - LAG(churn_rate) OVER (ORDER BY num_profiles_created)) * 100 AS churn_diff_percent
FROM
	churn_by_num_profiles_created
ORDER BY
	num_profiles_created
