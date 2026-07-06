USE music_streaming_app;

/*
1. Create a table called Orders with columns: order_id, user_id, payment_method, and amount. 
Insert at least 8 sample records representing different users and payment methods (like UPI, Card, Wallet, COD).
*/

CREATE TABLE Orders_md (
    order_id INT PRIMARY KEY,
    user_id INT,
    payment_method VARCHAR(20),
    amount DECIMAL(10 , 2 )
);

INSERT INTO Orders_md VALUES
(1, 101, 'UPI', 250.00),
(2, 102, 'Card', 450.00),
(3, 101, 'Wallet', 300.00),
(4, 103, 'COD', 600.00),
(5, 104, 'UPI', 150.00),
(6, 102, 'Card', 550.00),
(7, 103, 'UPI', 400.00),
(8, 105, 'Wallet', 700.00);

/*
2. Write an SQL query to count how many orders were placed using each payment_method in the Orders table, similar to how Zomato shows payment breakdown in analytics.
*/

SELECT 
    payment_method, COUNT(*) AS order_count
FROM
    Orders_md
GROUP BY payment_method;

/*
3. Write an SQL query to find the total amount spent by each user_id in the Orders table. Display user_id and their total spend.
*/

SELECT 
    user_id, SUM(amount) AS total_spend
FROM
    Orders_md
GROUP BY user_id;

/*
4. Write an SQL query to show only those payment methods where the average order amount is greater than 300, using GROUP BY and HAVING.
<br><br><em><strong>Hint:</strong> Use AVG(amount) in your HAVING clause.</em>
*/

SELECT 
    payment_method, AVG(amount) AS average_amount
FROM
    Orders_md
GROUP BY payment_method
HAVING AVG(amount) > 300;

/*
5. Explain the difference between WHERE and HAVING by giving one example query for each, using the Orders table. 
Your examples should show a scenario where WHERE and HAVING filter different things.
*/

/*
| WHERE                                                                        | HAVING                                                                 |
| ---------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Filters individual rows **before** grouping.                                 | Filters grouped results **after** `GROUP BY`.                          |
| Cannot use aggregate functions like `SUM()`, `COUNT()`, or `AVG()` directly. | Used with aggregate functions such as `SUM()`, `COUNT()`, and `AVG()`. |
*/

-- Example Using WHERE

SELECT 
    *
FROM
    Orders_md
WHERE
    amount > 300;
    
-- Example Using HAVING

SELECT 
    payment_method, AVG(amount) AS average_amount
FROM
    Orders_md
GROUP BY payment_method
HAVING AVG(amount) > 300;