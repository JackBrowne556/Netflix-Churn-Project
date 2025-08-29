-- The following eight SQL queries are to find the churn count for each customer segment and their respected categories, 
-- denoted in analysis_notebook.md
-- Key SQL Features: COUNT, CASE with MULTIPLE CONDITIONS
-- To Recreate: Run each SQL query seperately for each customer segment, denoted by "--".



-- Subscription Length (Months)
-- Categories: Month Count 1,3,6,12,24

SELECT 
	COUNT(CASE WHEN sub_length = '1' AND churn_status = 'Yes' THEN 'one_month_churn_number' END) AS one_month_churn_number,
	COUNT(CASE WHEN sub_length = '3' AND churn_status = 'Yes' THEN 'three_month_churn_number' END) AS three_month_churn_number,
	COUNT(CASE WHEN sub_length = '6' AND churn_status = 'Yes' THEN 'six_month_churn_number' END) AS six_month_churn_number,
	COUNT(CASE WHEN sub_length = '12' AND churn_status = 'Yes' THEN 'twelve_month_churn_number' END) AS twelve_month_churn_number,
	COUNT(CASE WHEN sub_length = '24' AND churn_status = 'Yes' THEN 'twenty_four_month_churn_number' END) AS twenty_four_month_churn_number
FROM 
	netflix_user_data


-- Region
-- Categories: North America, South America, Africa, Asia, Europe

SELECT 
	COUNT(CASE WHEN region = 'North America' AND churn_status = 'Yes' THEN 'na_churn_number' END) AS na_churn_number,
	COUNT(CASE WHEN region = 'South America' AND churn_status = 'Yes' THEN 'sa_churn_number' END) AS sa_churn_number,
	COUNT(CASE WHEN region = 'Europe' AND churn_status = 'Yes' THEN 'eu_churn_number' END) AS eu_churn_number,
	COUNT(CASE WHEN region = 'Asia' AND churn_status = 'Yes' THEN 'asia_churn_number' END) AS asia_churn_number,
	COUNT(CASE WHEN region = 'Africa' AND churn_status = 'Yes' THEN 'africa_churn_number' END) AS africa_churn_number
FROM 
	netflix_user_data


-- Subscription Plan Type
-- Categories: Basic / Standard with ads, Standard, Premium

SELECT 
	COUNT(CASE WHEN sub_plan = 'Basic' AND churn_status = 'Yes' THEN 'basic_churn_number' END) AS basic_churn_number,
	COUNT(CASE WHEN sub_plan = 'Standard' AND churn_status = 'Yes' THEN 'standard_churn_number' END) AS standard_churn_number,
	COUNT(CASE WHEN sub_plan = 'Premium' AND churn_status = 'Yes' THEN 'premium_churn_number' END) AS premium_churn_number
FROM
	netflix_user_data


-- Support Queries Logged
-- Categories: 0 - 3 Queries, 4 - 6 Queries, 7 - 10 Queries
-- Caveat: Uneven Data Distribution, fix later

SELECT 
	COUNT(CASE WHEN support_queries_logged >= 0 AND support_queries_logged < 3 AND churn_status = 'Yes' THEN 'low_query_churn_number' END) AS low_query_churn_number,
	COUNT(CASE WHEN support_queries_logged >= 4 AND support_queries_logged < 6 AND churn_status = 'Yes' THEN 'med_query_churn_number' END) AS med_query_churn_number,
	COUNT(CASE WHEN support_queries_logged >= 7 AND support_queries_logged < 10 AND churn_status = 'Yes' THEN 'high_query_churn_number' END) AS high_query_churn_number
FROM
	netflix_user_data


-- Age
-- Categories: 18 - 31 (Young Adult), 32 - 44 (Adult), 45 - 57 (Older Adult), 58 - 70 (Senior)
-- Caveat: Uneven Data Distribution. Maybe cut off 70 or 18.

SELECT 
	COUNT(CASE WHEN age >= 18 AND age < 31 AND churn_status = 'Yes' THEN 'young_adult_churn_number' END) AS young_adult_churn_number,
	COUNT(CASE WHEN age >= 32 AND age < 44 AND churn_status = 'Yes' THEN 'adult_churn_number' END) AS adult_churn_number,
	COUNT(CASE WHEN age >= 45 AND age < 57 AND churn_status = 'Yes' THEN 'older_adult_churn_number' END) AS older_adult_churn_number,
	COUNT(CASE WHEN age >= 58 AND age < 70 AND churn_status = 'Yes' THEN 'senior_churn_number' END) AS senior_churn_number
FROM
	netflix_user_data

-- Promotional Offers Used
-- Categories: 0 - 1, 2 - 3, 4 - 5.

SELECT 
	COUNT(CASE WHEN offers_used >= 0 AND offers_used < 1 AND churn_status = 'Yes' THEN 'zero_to_one_offer_churn_number' END) AS zero_to_one_offer_churn_number,
	COUNT(CASE WHEN offers_used >= 2 AND offers_used < 3 AND churn_status = 'Yes' THEN 'two_to_three_offer_churn_number' END) AS two_to_three_offer_churn_number,
	COUNT(CASE WHEN offers_used >= 4 AND offers_used < 5 AND churn_status = 'Yes' THEN 'four_to_five_offer_churn_number' END) AS four_to_five_offer_churn_number
FROM
	netflix_user_data

-- Number of Profiles Created
-- Categories: 1, 2, 3, 4, 5

SELECT 
	COUNT(CASE WHEN num_profiles_created = 1 AND churn_status = 'Yes' THEN 'one_profile_churn_number' END) AS one_profile_churn_number,
	COUNT(CASE WHEN num_profiles_created = 2 AND churn_status = 'Yes' THEN 'two_profiles_churn_number' END) AS two_profiles_churn_number,
	COUNT(CASE WHEN num_profiles_created = 3 AND churn_status = 'Yes' THEN 'three_profiles_churn_number' END) AS three_profiles_churn_number,
	COUNT(CASE WHEN num_profiles_created = 4 AND churn_status = 'Yes' THEN 'four_profiles_churn_number' END) AS four_profiles_churn_number,
	COUNT(CASE WHEN num_profiles_created = 5 AND churn_status = 'Yes' THEN 'five_profiles_churn_number' END) AS five_profiles_churn_number
FROM
	netflix_user_data



