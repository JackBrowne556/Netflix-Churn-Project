-- Question 4, see .md file for details

/*

	Find correlation between age and price plans across regions

	Purpose:

	- *For equal segments, excluding information from age = 70*
	- Use previous age group segmentation from Q2
*/

SELECT 
    region,
    CASE
      WHEN age BETWEEN 18 AND 30 THEN '18-30'
      WHEN age BETWEEN 31 AND 43 THEN '31-43'
      WHEN age BETWEEN 44 AND 56 THEN '44-56'
      WHEN age BETWEEN 57 AND 69 THEN '57-69'
    END AS age_group,  -- Age Groups
    COUNT(*) AS total_customers,
	/* Count of total customers for each age group */
	/* Below are the counts for each sub_plan for aggregated group (region, age_group) */
    COUNT(CASE WHEN sub_plan = 'Basic' THEN 1 END) AS basic_users,
    COUNT(CASE WHEN sub_plan = 'Standard' THEN 1 END) AS standard_users,
    COUNT(CASE WHEN sub_plan = 'Premium' THEN 1 END) AS premium_users
FROM 
    netflix_user_data
WHERE
	/* WHERE clause filters out age 70 to adhere to equal age_group segmentation */
    region IN ('North America', 'South America', 'Asia', 'Africa', 'Europe')
    AND age BETWEEN 18 AND 69
GROUP BY 
    region,
    age_group
ORDER BY 
    region,
    age_group;



-- Per Region Query (alternative)

/* 
	The following query is for easier viewing, with the only drawback is it being five queries ran 
	instead of one. 
	
	- Follow instructions in code annotations: swap out region in WHERE clause with specified region.
*/

SELECT 
	CASE
      WHEN age BETWEEN 18 AND 30 THEN '18-30'
      WHEN age BETWEEN 31 AND 43 THEN '31-43'
      WHEN age BETWEEN 44 AND 56 THEN '44-56'
      WHEN age BETWEEN 57 AND 69 THEN '57-69'
    END AS age_group,  -- Age Groups (for aggregate function)
	COUNT(*) AS total_customers,
	/* COUNT of users per sub_plan in each age group */
	COUNT(CASE WHEN sub_plan = 'Basic' THEN 'Basic' END) AS basic_users,
	COUNT(CASE WHEN sub_plan = 'Standard' THEN 'Standard' END) AS standard_users,
	COUNT(CASE WHEN sub_plan = 'Premium' THEN 'Premium' END) AS premium_users
FROM 
	netflix_user_data
WHERE
	region = 'North America'
	/* Switch "North America" with each of the four other regions "South America, Europe, Asia, Africa"
		to find information on other regions for the aggregated table. */
AND age BETWEEN 18 AND 69
/* WHERE AND clause for age filters out age 70 to adhere to proper group segmentation.*/
GROUP BY 
	age_group
ORDER BY 
	age_group
