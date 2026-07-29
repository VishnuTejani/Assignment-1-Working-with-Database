USE music_streaming_app;

/*
1. Create a table called Orders with columns: order_id, user_id, order_date, and total_amount. 
Insert at least 7 sample rows representing different users and dates, similar to how food orders appear in Zomato or Swiggy.
*/

CREATE TABLE orders_wf (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);
INSERT INTO orders_wf VALUES
(101, 1, '2026-07-01', 250.00),
(102, 1, '2026-07-05', 400.00),
(103, 1, '2026-07-10', 350.00),
(104, 2, '2026-07-02', 180.00),
(105, 2, '2026-07-06', 220.00),
(106, 3, '2026-07-03', 500.00),
(107, 3, '2026-07-08', 650.00),
(108, 3, '2026-07-12', 700.00);

/*
2. Write a SQL query using the LAG() function to show each user's order_id, order_date, and the total_amount of their previous order (if any), 
ordered by user and date.<br><br><em><strong>Hint:</strong> Use PARTITION BY user_id and ORDER BY order_date in your window function.</em>
*/

SELECT 
	*, LAG(total_amount) OVER(PARTITION BY user_id ORDER BY order_date) 
FROM 
	orders_wf;

/*
3. Using the same Orders table, write a SQL query with the LEAD() function to display each order_id, order_date, and the next order's total_amount for the same user.
*/

SELECT 
	*, LEAD(total_amount) OVER(PARTITION BY user_id ORDER BY order_date) 
FROM 
	orders_wf;

/*
4. Write a SQL query to calculate the running total of total_amount for each user, showing order_id, order_date, total_amount, and 
a column running_total that accumulates the sum as you move through each user's orders.
<br><br><em><strong>Hint:</strong> Use SUM(total_amount) OVER (PARTITION BY user_id ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW).</em>
*/

SELECT 
	*, SUM(total_amount) OVER(ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
FROM 
	orders_wf;

/*
5. Write a SQL query to calculate a 3-order moving average of total_amount for each user, showing order_id, order_date, total_amount, and moving_avg columns.
<br><br><em><strong>Constraint:</strong> Use SUM() OVER() with ROWS BETWEEN 2 PRECEDING AND CURRENT ROW to compute the moving average.</em>
*/

SELECT 
	*, AVG(total_amount) OVER(ORDER BY order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM 
	orders_wf;