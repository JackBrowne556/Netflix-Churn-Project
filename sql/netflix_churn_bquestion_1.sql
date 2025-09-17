-- Question 1, see .md file for details



-- Subscription Length (Months)
-- Categories: Month Count 1,3,6,12,24

SELECT
    CASE
        WHEN sub_length = 1  THEN '1 Month'
        WHEN sub_length = 3  THEN '3 Months'
        WHEN sub_length = 6  THEN '6 Months'
        WHEN sub_length = 12 THEN '12 Months'
        WHEN sub_length = 24 THEN '24 Months'
    END AS subscription_length,
    COUNT(*) AS churned_count
FROM netflix_user_data
WHERE churn_status = 'Yes'
  AND sub_length IN (1,3,6,12,24)
GROUP BY subscription_length
ORDER BY subscription_length;


-- Region
-- Categories: North America, South America, Africa, Asia, Europe

SELECT
    region,
    COUNT(*) AS churned_count
FROM netflix_user_data
WHERE churn_status = 'Yes'
  AND region IN ('North America','South America','Europe','Asia','Africa')
GROUP BY region
ORDER BY region;


-- Subscription Plan Type
-- Categories: Basic / Standard with ads, Standard, Premium

SELECT
    sub_plan,
    COUNT(*) AS churned_count
FROM netflix_user_data
WHERE churn_status = 'Yes'
  AND sub_plan IN ('Basic','Standard','Premium')
GROUP BY sub_plan
ORDER BY sub_plan;


-- Support Queries Logged
-- Categories: 0 - 10

SELECT
    support_queries_logged AS query_count,
    COUNT(*) AS churned_count
FROM netflix_user_data
WHERE churn_status = 'Yes'
  AND support_queries_logged BETWEEN 0 AND 10
GROUP BY support_queries_logged
ORDER BY support_queries_logged;


-- Age
-- Categories: 18 - 30 (Young Adult), 31 - 43 (Adult), 44 - 56 (Older Adult), 57 - 69 (Senior)

SELECT
    CASE
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 43 THEN '31-43'
        WHEN age BETWEEN 44 AND 56 THEN '44-56'
        WHEN age BETWEEN 57 AND 69 THEN '57-69'
    END AS age_group,
    COUNT(*) AS churned_count
FROM netflix_user_data
WHERE churn_status = 'Yes'
  AND age BETWEEN 18 AND 69
GROUP BY age_group
ORDER BY age_group;

-- Promotional Offers Used
-- Categories: 0 - 1, 2 - 3, 4 - 5.

SELECT
    CASE
        WHEN offers_used BETWEEN 0 AND 1 THEN '0-1'
        WHEN offers_used BETWEEN 2 AND 3 THEN '2-3'
        WHEN offers_used BETWEEN 4 AND 5 THEN '4-5'
    END AS offers_group,
    COUNT(*) AS churned_count
FROM netflix_user_data
WHERE churn_status = 'Yes'
  AND offers_used BETWEEN 0 AND 5
GROUP BY offers_group
ORDER BY offers_group;

-- Number of Profiles Created
-- Categories: 1, 2, 3, 4, 5

SELECT
    num_profiles_created AS profile_count,
    COUNT(*) AS churned_count
FROM netflix_user_data
WHERE churn_status = 'Yes'
  AND num_profiles_created BETWEEN 1 AND 5
GROUP BY num_profiles_created
ORDER BY num_profiles_created;



