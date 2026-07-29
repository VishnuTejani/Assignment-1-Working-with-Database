use sales_analysis;

/*
1. Import a CSV file of food delivery orders (with columns like order_id, restaurant_name, customer_name, order_amount, order_date) into 
a new SQL table named FoodOrders using your database tool of choice.
*/

SELECT 
    *
FROM
    foodorders;

/*
2. Write SQL statements to create a table called TopSongs with columns: song_id, song_title, artist, streams, and release_date, then 
insert at least 5 records representing popular tracks from Spotify.
*/

CREATE TABLE TopSongs (
    song_id INT PRIMARY KEY,
    song_title VARCHAR(100),
    artist VARCHAR(100),
    streams BIGINT,
    release_date DATE
);

INSERT INTO TopSongs (song_id, song_title, artist, streams, release_date) VALUES
(1,'Blinding Lights','The Weeknd',4500000000,'2019-11-29'),
(2,'Shape of You','Ed Sheeran',4200000000,'2017-01-06'),
(3,'Flowers','Miley Cyrus',1800000000,'2023-01-13'),
(4,'As It Was','Harry Styles',2900000000,'2022-04-01'),
(5,'Levitating','Dua Lipa',2500000000,'2020-10-01'),
(6,'Bad Habits','Ed Sheeran',2100000000,'2021-06-25'),
(7,'Stay','The Kid LAROI & Justin Bieber',2600000000,'2021-07-09'),
(8,'Peaches','Justin Bieber',1700000000,'2021-03-19'),
(9,'Watermelon Sugar','Harry Styles',2200000000,'2019-11-16'),
(10,'Dance Monkey','Tones and I',3000000000,'2019-05-10'),
(11,'Someone You Loved','Lewis Capaldi',2800000000,'2018-11-08'),
(12,'Perfect','Ed Sheeran',3100000000,'2017-03-03'),
(13,'Believer','Imagine Dragons',2700000000,'2017-02-01'),
(14,'Sunflower','Post Malone & Swae Lee',2900000000,'2018-10-18'),
(15,'Rockstar','Post Malone',2100000000,'2017-09-15'),
(16,'Senorita','Shawn Mendes & Camila Cabello',2000000000,'2019-06-21'),
(17,'Lovely','Billie Eilish & Khalid',1800000000,'2018-04-19'),
(18,'Heat Waves','Glass Animals',2500000000,'2020-06-29'),
(19,'Unholy','Sam Smith & Kim Petras',1500000000,'2022-09-22'),
(20,'Anti-Hero','Taylor Swift',1900000000,'2022-10-21'),
(21,'Cruel Summer','Taylor Swift',1700000000,'2019-08-23'),
(22,'Easy On Me','Adele',1600000000,'2021-10-15'),
(23,'Shivers','Ed Sheeran',1900000000,'2021-09-10'),
(24,'Ghost','Justin Bieber',1800000000,'2021-03-19'),
(25,'Industry Baby','Lil Nas X & Jack Harlow',1700000000,'2021-07-23'),
(26,'Happier Than Ever','Billie Eilish',1400000000,'2021-07-30'),
(27,'Good 4 U','Olivia Rodrigo',1800000000,'2021-05-14'),
(28,'Drivers License','Olivia Rodrigo',1900000000,'2021-01-08'),
(29,'Calm Down','Rema & Selena Gomez',2100000000,'2022-08-26'),
(30,'Cupid','FIFTY FIFTY',1500000000,'2023-02-24'),
(31,'Seven','Jungkook',1600000000,'2023-07-14'),
(32,'Greedy','Tate McRae',1300000000,'2023-09-15'),
(33,'Paint The Town Red','Doja Cat',1400000000,'2023-08-04'),
(34,'Espresso','Sabrina Carpenter',1200000000,'2024-04-11'),
(35,'Fortnight','Taylor Swift ft. Post Malone',1100000000,'2024-04-19'),
(36,'Lose Control','Teddy Swims',1200000000,'2023-08-18'),
(37,'Beautiful Things','Benson Boone',1000000000,'2024-01-18'),
(38,'Houdini','Dua Lipa',900000000,'2023-11-09'),
(39,'Die With A Smile','Lady Gaga & Bruno Mars',850000000,'2024-08-16'),
(40,'APT.','ROSÉ & Bruno Mars',800000000,'2024-10-18'),
(41,'On My Way','Alan Walker',1400000000,'2019-03-21'),
(42,'Faded','Alan Walker',2300000000,'2015-12-03'),
(43,'Alone','Alan Walker',1800000000,'2016-12-02'),
(44,'Ignite','Alan Walker',900000000,'2018-07-11'),
(45,'Spectre','Alan Walker',1200000000,'2017-01-01'),
(46,'Counting Stars','OneRepublic',2400000000,'2013-06-14'),
(47,'Closer','The Chainsmokers ft. Halsey',2600000000,'2016-07-29'),
(48,'Memories','Maroon 5',2100000000,'2019-09-20'),
(49,'Thunder','Imagine Dragons',2200000000,'2017-04-27'),
(50,'Bones','Imagine Dragons',1500000000,'2022-03-11');

/*
3. Write an SQL query to find the top 3 customers who ordered the most from the FoodOrders table based on total order_amount, and display their names and total spent.
*/

SELECT 
	customer_name, SUM(order_amount) AS TotalSpent, RANK() OVER(ORDER BY TotalSpent DESC) AS Top_3
FROM 
	foodorders 
    GROUP BY customer_name 
    LIMIT 3;

/*
4. Generate a product performance report by writing an SQL query that lists each restaurant_name from FoodOrders, the number of orders, and 
the total order_amount, ordered by total order_amount descending.<br><br><em><strong>Hint:</strong> Use GROUP BY and ORDER BY clauses.</em>
*/

SELECT
	restaurant_name,
    count(order_id) AS NumberOfOrders,
    sum(order_amount) AS TotalAmount
FROM
	foodorders
	GROUP BY restaurant_name
    ORDER BY TotalAmount DESC;

/*
5. Create an SQL query that calculates two KPIs for the FoodOrders table: (1) average order_amount and (2) total number of unique customers, 
and format the output for dashboard display (two columns: kpi_name, kpi_value).
*/

SELECT 
    'Average Order Amount' AS kpi_name,
    AVG(order_amount) AS kpi_value
FROM
    foodorders 
UNION ALL SELECT 
    'Number of Unique Customer' AS kpi_name,
    COUNT(DISTINCT customer_name) AS kpi_value
FROM
    foodorders;
