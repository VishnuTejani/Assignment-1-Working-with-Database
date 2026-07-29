USE music_streaming_app;

/*
1.Create a CTE using the WITH clause to select all products with a rating above 4.5 from a 'Products' table, 
similar to how Flipkart or Myntra might highlight top-rated items.
*/

WITH TopRatedProducts AS (
    SELECT *
    FROM products
    WHERE rating > 4.5
)
SELECT *
FROM TopRatedProducts;

/*
2. Rewrite a query that finds all restaurants in 'Ahmedabad' with delivery charges under 50 from a 'Restaurants' table, first using a subquery and then using a CTE. 
Compare both queries for readability.<br><br><em><strong>Hint:</strong> Focus on making the CTE version cleaner and easier to understand.</em>
*/

WITH AhmedabadRestaurants AS (
    SELECT *
    FROM restaurants_cte
    WHERE city = 'Ahmedabad'
)
SELECT *
FROM AhmedabadRestaurants
WHERE delivery_charge < 50;

/*
3. Using two CTEs in a single query, find the top 3 most-followed users and the top 3 most-liked posts from a 'Users' and 'Posts' table (think Instagram-style data). 
Output both lists in the same result set.
*/

WITH TopUsers AS (
    SELECT
        username AS name,
        followers AS count_value
    FROM users_cte
    ORDER BY followers DESC
    LIMIT 3
),
TopPosts AS (
    SELECT
        post_title AS name,
        likes AS count_value
    FROM posts
    ORDER BY likes DESC
    LIMIT 3
)

SELECT 
    'Top User' AS category, name, count_value
FROM
    TopUsers 
UNION ALL SELECT 
    'Top Post' AS category, name, count_value
FROM
    TopPosts;

/*
4. Write a recursive CTE that generates a list of dates for the next 7 days starting from today, similar to how BookMyShow shows available dates for movie bookings.
<br><br><em><strong>Hint:</strong> Use a base case for today and recursion to add one day at a time.</em>
*/

WITH RECURSIVE Next7Days AS (
    SELECT 
        CURDATE() AS booking_date,
        1 AS day_no

    UNION ALL

    SELECT 
        DATE_ADD(booking_date, INTERVAL 1 DAY),
        day_no + 1
    FROM Next7Days
    WHERE day_no < 7
)

SELECT 
    booking_date
FROM
    Next7Days;

/*
5. Given a messy SQL query that finds all users with more than 1000 followers from a 'Users' table, refactor it to use a CTE for better clarity and maintainability.
*/

WITH PopularUsers AS (
    SELECT *
    FROM Users_CTE
    WHERE followers > 1000
)
SELECT 
    *
FROM
    PopularUsers;