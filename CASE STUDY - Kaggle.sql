CREATE DATABASE case_study_kaggle;
USE case_study_kaggle;

/*
1. Write an SQL query to find the top 5 highest-rated restaurants in Koramangala that serve North Indian cuisine, using the Zomato Bangalore dataset.
*/

SELECT 
    *
FROM
    top_rated_koramangala_restaurants
WHERE
    location = 'Koramangala'
        AND cuisine = 'North Indian'
ORDER BY rating DESC , votes DESC
LIMIT 5;

/*
2. Using SQL, calculate the average cost for two people for each cuisine type and list the 3 most expensive cuisines to eat in Bangalore.
*/

SELECT 
    cuisine, AVG(average_cost_for_two) AS average_cost
FROM
    cuisine_average_cost
GROUP BY cuisine
ORDER BY average_cost DESC
LIMIT 3;

/*
3. Find all restaurants that offer online delivery but have a rating below 3.0, and suggest a marketing strategy to improve their ratings based on your findings.
<br><br><em><strong>Hint:</strong> Look for patterns in location, cuisine, or price that might explain the low ratings.</em>
*/

SELECT 
    *
FROM
    low_rated_online_delivery_restaurants
WHERE
    online_order = 'Yes' AND rating < 3.0
ORDER BY rating ASC;

/*
4. Write an SQL query to segment restaurants into three market segments based on average cost for two: budget (below 400), mid-range (400-800), and premium (above 800). 
Count how many restaurants fall into each segment.
*/

SELECT 
    Market_Segment, COUNT(*) AS Total_Restaurants
FROM
    (SELECT 
        CASE
                WHEN approx_cost_for_two < 400 THEN 'Budget'
                WHEN approx_cost_for_two BETWEEN 400 AND 800 THEN 'Mid-Range'
                ELSE 'Premium'
            END AS Market_Segment
    FROM
        restaurant_market_segments) AS segments
GROUP BY Market_Segment;

/*
5. Use ChatGPT or Copilot to help you write an SQL query that lists the top 10 most popular restaurant chains (by number of outlets) 
in the dataset, then run and validate the query yourself.<br><br><em><strong>Hint:</strong> Search for 'SQL group by count example' if you get stuck.</em>
*/

SELECT 
    *
FROM
    restaurant_chain_outlets
ORDER BY total_outlets DESC
LIMIT 10;