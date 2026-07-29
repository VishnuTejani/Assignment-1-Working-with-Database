CREATE DATABASE hr_analysis;
USE hr_analysis;

/*	
1. Create a SQL table called Restaurant with columns: id, name, cuisine, location, and average_rating. 
Insert at least 5 sample rows representing popular restaurants from Zomato.
*/

CREATE TABLE Restaurant (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    location VARCHAR(100),
    average_rating DECIMAL(2,1)
);
INSERT INTO Restaurant (id, name, cuisine, location, average_rating) VALUES
(1,'Barbeque Nation','North Indian','Ahmedabad',4.5),
(2,'Domino''s Pizza','Italian','Surat',4.2),
(3,'Mainland China','Chinese','Vadodara',4.6),
(4,'Spice Villa','Gujarati','Rajkot',4.1),
(5,'La Pinoz Pizza','Italian','Ahmedabad',4.4),
(6,'KFC','Fast Food','Surat',4.3),
(7,'McDonald''s','Fast Food','Ahmedabad',4.2),
(8,'Subway','Healthy','Vadodara',4.0),
(9,'Pizza Hut','Italian','Rajkot',4.3),
(10,'Havmor Restaurant','Gujarati','Ahmedabad',4.5),
(11,'The Grand Thakar','Gujarati','Surat',4.6),
(12,'Honest','Fast Food','Vadodara',4.2),
(13,'Sankalp','South Indian','Ahmedabad',4.4),
(14,'Saravana Bhavan','South Indian','Rajkot',4.7),
(15,'Udupi Restaurant','South Indian','Surat',4.3),
(16,'China Town','Chinese','Ahmedabad',4.1),
(17,'Wok Express','Chinese','Surat',4.4),
(18,'Biryani Blues','Hyderabadi','Vadodara',4.5),
(19,'Behrouz Biryani','Hyderabadi','Ahmedabad',4.6),
(20,'Paradise Biryani','Hyderabadi','Rajkot',4.4),
(21,'The Chocolate Room','Cafe','Ahmedabad',4.5),
(22,'Cafe Coffee Day','Cafe','Surat',4.0),
(23,'Starbucks','Cafe','Vadodara',4.7),
(24,'Tea Post','Cafe','Rajkot',4.2),
(25,'Gordhan Thal','Gujarati','Ahmedabad',4.8),
(26,'Rajwadu','Gujarati','Ahmedabad',4.6),
(27,'Tandoor Palace','North Indian','Surat',4.4),
(28,'Punjab Grill','North Indian','Vadodara',4.7),
(29,'Amritsari Kulcha','North Indian','Rajkot',4.3),
(30,'Bombay Street','Fast Food','Ahmedabad',4.1),
(31,'Burger King','Fast Food','Surat',4.3),
(32,'Wow Momo','Fast Food','Vadodara',4.2),
(33,'Faasos','Rolls','Ahmedabad',4.4),
(34,'Roll Express','Rolls','Rajkot',4.1),
(35,'Kathi Junction','Rolls','Surat',4.3),
(36,'Sizzler House','Continental','Ahmedabad',4.5),
(37,'The Eatery','Continental','Vadodara',4.4),
(38,'Olive Bistro','Continental','Surat',4.6),
(39,'Little Italy','Italian','Ahmedabad',4.8),
(40,'Pizzeria Roma','Italian','Rajkot',4.2),
(41,'Dragon House','Chinese','Surat',4.5),
(42,'Golden Dragon','Chinese','Vadodara',4.6),
(43,'Bikanervala','North Indian','Ahmedabad',4.3),
(44,'Hocco Eatery','Cafe','Ahmedabad',4.5),
(45,'The Belgian Waffle Co.','Desserts','Surat',4.7),
(46,'Baskin Robbins','Desserts','Vadodara',4.4),
(47,'Cream Stone','Desserts','Rajkot',4.5),
(48,'Natural Ice Cream','Desserts','Ahmedabad',4.8),
(49,'Shree Marutinandan','Gujarati','Vadodara',4.3),
(50,'Swati Snacks','Gujarati','Ahmedabad',4.7);

/*	
2. Write a SQL query to generate a report showing the number of restaurants for each cuisine type from your Restaurant table, 
ordered by the count in descending order. <br><br><em><strong>Hint:</strong> Use GROUP BY and ORDER BY.</em>
*/

SELECT 
    cuisine, COUNT(*) AS TotalRestaurant
FROM
    restaurant
GROUP BY cuisine
ORDER BY TotalRestaurant DESC;

/*	
3. Add a new table called Review with columns: id, restaurant_id, user_name, rating, and review_date. 
Insert at least 10 sample reviews, linking them to restaurants using restaurant_id.
*/

CREATE TABLE Review (
    id INT PRIMARY KEY,
    restaurant_id INT,
    user_name VARCHAR(100),
    rating DECIMAL(2,1),
    review_date DATE,
    FOREIGN KEY (restaurant_id)
    REFERENCES Restaurant(id)
);

INSERT INTO Review (id, restaurant_id, user_name, rating, review_date) VALUES
(1,1,'Rahul',4.5,'2026-07-01'),
(2,1,'Priya',4.8,'2026-07-02'),
(3,1,'Amit',4.4,'2026-07-03'),
(4,2,'Neha',4.2,'2026-07-04'),
(5,2,'Rohan',4.0,'2026-07-05'),
(6,3,'Kiran',4.9,'2026-07-06'),
(7,3,'Meera',4.7,'2026-07-07'),
(8,3,'Jay',4.8,'2026-07-08'),
(9,4,'Anjali',4.1,'2026-07-09'),
(10,4,'Vivek',4.3,'2026-07-10'),
(11,5,'Sneha',4.4,'2026-07-11'),
(12,5,'Arjun',4.5,'2026-07-12'),
(13,6,'Pooja',4.3,'2026-07-13'),
(14,6,'Harsh',4.2,'2026-07-14'),
(15,7,'Isha',4.1,'2026-07-15'),
(16,7,'Manav',4.4,'2026-07-16'),
(17,8,'Nisha',4.0,'2026-07-17'),
(18,8,'Yash',4.2,'2026-07-18'),
(19,9,'Kajal',4.3,'2026-07-19'),
(20,9,'Parth',4.5,'2026-07-20'),
(21,10,'Riya',4.6,'2026-07-21'),
(22,10,'Dev',4.4,'2026-07-22'),
(23,11,'Komal',4.8,'2026-07-23'),
(24,11,'Aakash',4.6,'2026-07-24'),
(25,12,'Bhavya',4.1,'2026-07-25'),
(26,12,'Dhruv',4.3,'2026-07-26'),
(27,13,'Khushi',4.5,'2026-07-27'),
(28,13,'Mohit',4.6,'2026-07-28'),
(29,14,'Tanvi',4.8,'2026-07-29'),
(30,14,'Nirav',4.9,'2026-07-30'),
(31,15,'Sonal',4.3,'2026-07-31'),
(32,15,'Raj',4.4,'2026-08-01'),
(33,16,'Jinal',4.2,'2026-08-02'),
(34,17,'Deep',4.5,'2026-08-03'),
(35,18,'Krupa',4.7,'2026-08-04'),
(36,19,'Meet',4.8,'2026-08-05'),
(37,20,'Heena',4.4,'2026-08-06'),
(38,21,'Nikhil',4.6,'2026-08-07'),
(39,22,'Payal',4.1,'2026-08-08'),
(40,23,'Sagar',4.9,'2026-08-09'),
(41,24,'Tina',4.2,'2026-08-10'),
(42,25,'Varun',4.8,'2026-08-11'),
(43,1,'Zara',4.7,'2026-08-12'),
(44,3,'Aarav',4.9,'2026-08-13'),
(45,5,'Diya',4.6,'2026-08-14'),
(46,10,'Ritesh',4.5,'2026-08-15'),
(47,14,'Mitali',4.8,'2026-08-16'),
(48,21,'Chirag',4.7,'2026-08-17'),
(49,23,'Vaibhav',4.8,'2026-08-18'),
(50,25,'Ananya',4.9,'2026-08-19');

/*	
4. Write a SQL query using a JOIN to display each restaurant's name, cuisine, and its average review rating (from the Review table), 
ordered by highest average rating first. <br><br><em><strong>Hint:</strong> Use JOIN and GROUP BY with aggregate functions.</em>
*/

SELECT 
    r.name, r.cuisine, AVG(rv.rating) AS AvgRating
FROM
    restaurant r
        JOIN
    review rv ON r.id = rv.restaurant_id
GROUP BY r.id , r.name , r.cuisine
ORDER BY AvgRating DESC;

/*
5. Use a window function to rank restaurants by their average review rating within each cuisine type, 
showing the restaurant name, cuisine, average rating, and rank.<br><br><em><strong>Hint:</strong> Use the RANK() or DENSE_RANK() window function partitioned by cuisine.</em>
*/

SELECT
    name,
    cuisine,
    average_review_rating,
    RANK() OVER (
        PARTITION BY cuisine
        ORDER BY average_review_rating DESC
    ) AS restaurant_rank
FROM (
    SELECT
        r.name,
        r.cuisine,
        AVG(rv.rating) AS average_review_rating
    FROM Restaurant r
    JOIN Review rv
    ON r.id = rv.restaurant_id
    GROUP BY
        r.id,
        r.name,
        r.cuisine
) AS RestaurantRatings;