-- Question 6, refer to .md for details

/*


	Purpose:

	- Find the Average Revenue per user (ARPU), according to region and subscription plan
	- Doesn't take into account churned users, goal is to build on Q5 to find average
		revenue per customer within the given data


*/

SELECT
    region,
	sub_plan,
    ROUND(
        SUM(price_usd * sub_length)::numeric 
        / NULLIF(COUNT(DISTINCT customer_id), 0),
        2
    ) AS avg_revenue_per_customer
	/* multiplies sum of price by total subscription length (to find per-month value) 
		then divides by total number of customers */
FROM
	netflix_user_data AS usern
LEFT JOIN
	country_fee AS c_fee
USING 
	(region, sub_plan)
GROUP BY
    region,
	sub_plan
ORDER BY
    region,
	sub_plan;

	