-- Question 3, refer to .md file for details.

-- Region

/* 
	Purpose: 
		Calculate Average Subscription Length time for each region
		(North America, South America, Europe, Asia, Africa).

	Notes:
		- KPI is average subscription time for each category
		- Aim marketing strategies, depending on:
			- lowest avg sub time out of all customer segments
			- For each customer segment, the "winners" and "losers" of sub time within own segment.
*/

SELECT
	"region" AS region, -- To be used as aggregate function
	ROUND(AVG(sub_length), 2) AS avg_months_subscribed -- sub_length average for each region, rounded
FROM
	netflix_user_data
GROUP BY 
	region -- Aggregate at region
ORDER BY 
	avg_months_subscribed -- Order by months subscribed



-- Subscription Plan Type

/* 
	Purpose: 
		Calculate Average Subscription Length time for each plan type
		(Basic, Standard, Premium).

*/

SELECT
	"sub_plan" AS sub_plan, -- To be used as aggregate function
	ROUND(AVG(sub_length), 2) AS avg_months_subscribed -- sub_length average for each subscription plan, rounded
FROM
	netflix_user_data
GROUP BY 
	sub_plan -- Aggregate at sub_plan
ORDER BY 
	avg_months_subscribed -- Order by months subscribed


-- Support Queries Logged

/* 
	Purpose: 
		Calculate Average Subscription Length time for each subscription query logged group
		(1-10).
*/

SELECT
	"support_queries_logged" AS support_queries_logged, -- To be used as aggregate function
	ROUND(AVG(sub_length), 2) AS avg_months_subscribed -- sub_length average for each support query logged, rounded
FROM
	netflix_user_data
GROUP BY 
	support_queries_logged -- Aggregate at support_queries_logged
ORDER BY 
	avg_months_subscribed -- Order by months subscribed


-- Age

/* 
	Purpose: 
		Calculate Average Subscription Length time for each age group
		(19-31, 32-44, 45-57, 58-70)
*/

SELECT
	CASE
      WHEN age BETWEEN 18 AND 30 THEN '18-30'
      WHEN age BETWEEN 31 AND 43 THEN '31-43'
      WHEN age BETWEEN 44 AND 56 THEN '44-56'
      WHEN age BETWEEN 57 AND 70 THEN '57-70'
    END AS age_group,  -- Age Groups
	ROUND(AVG(sub_length), 2) AS avg_months_subscribed -- sub_length average for each age group, rounded
FROM
	netflix_user_data
GROUP BY 
	age_group -- Aggregate at age groups
ORDER BY 
	avg_months_subscribed -- Order by months subscribed


-- Promotional Offers Used

/* 
	Purpose: 
		Calculate Average Subscription Length time for each promotional offers used group
		(0-1, 2-3, 4-5)
- 
*/

SELECT
	"offers_used" AS offers_used, -- To be used as aggregate function
	ROUND(AVG(sub_length), 2) AS avg_months_subscribed -- sub_length average for each age group, rounded
FROM
	netflix_user_data
GROUP BY 
	offers_used -- Aggregate at age groups
ORDER BY 
	offers_used -- Order by months subscribed



-- Number of Profiles Created

/* 
	Purpose: 
		Calculate Average Subscription Length time for each account with x profiles created
		(1-5).
*/

SELECT
	"num_profiles_created" AS num_profiles_created, -- To be used as aggregate function
	ROUND(AVG(sub_length), 2) AS avg_months_subscribed -- sub_length average for each support query logged, rounded
FROM
	netflix_user_data
GROUP BY 
	num_profiles_created -- Aggregate at number of profiles created
ORDER BY 
	avg_months_subscribed -- Order by months subscribed

