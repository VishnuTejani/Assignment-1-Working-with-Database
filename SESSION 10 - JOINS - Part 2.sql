USE music_streaming_app;

/*
1. Create two tables: Influencers (id, name) and Collaborations (id, influencer1_id, influencer2_id, collab_date). 
Write a SQL FULL JOIN query to list all influencers and show their collaboration partner names if any, including influencers with no collaborations.
*/
CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Collaborations (
    id INT PRIMARY KEY,
    influencer1_id INT,
    influencer2_id INT,
    collab_date DATE,
    FOREIGN KEY (influencer1_id)
        REFERENCES Influencers (id),
    FOREIGN KEY (influencer2_id)
        REFERENCES Influencers (id)
);

INSERT INTO Influencers VALUES
(1, 'Aarav'),
(2, 'Diya'),
(3, 'Kabir'),
(4, 'Meera'),
(5, 'Rohan');

INSERT INTO Collaborations VALUES
(1, 1, 2, '2026-07-01'),
(2, 2, 3, '2026-07-05'),
(3, 3, 4, '2026-07-10');

SELECT 
    i1.name AS influencer_name,
    i2.name AS collaboration_partner,
    c.collab_date
FROM
    Influencers i1
        LEFT JOIN
    Collaborations c ON i1.id = c.influencer1_id
        LEFT JOIN
    Influencers i2 ON c.influencer2_id = i2.id 
UNION SELECT 
    i2.name AS influencer_name,
    i1.name AS collaboration_partner,
    c.collab_date
FROM
    Influencers i2
        RIGHT JOIN
    Collaborations c ON i2.id = c.influencer2_id
        LEFT JOIN
    Influencers i1 ON c.influencer1_id = i1.id;
    
/*
 2. Using a SELF JOIN, write a query on a table called Playlists (id, user_id, playlist_name, parent_playlist_id) 
	to display each playlist alongside its parent playlist name, similar to how Spotify shows nested playlists.
	<br><br><em><strong>Hint:</strong> Join Playlists with itself on parent_playlist_id = id.</em>
*/

CREATE TABLE Playlists_join (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    parent_playlist_id INT
);

INSERT INTO Playlists_join VALUES
(1, 101, 'My Music', NULL),
(2, 101, 'Workout Songs', 1),
(3, 101, 'Gym Motivation', 2),
(4, 102, 'Favorites', NULL),
(5, 102, 'Chill Songs', 4);

SELECT 
    child.id,
    child.playlist_name AS playlist_name,
    parent.playlist_name AS parent_playlist_name
FROM
    Playlists child
        LEFT JOIN
    Playlists parent ON child.parent_playlist_id = parent.id;
    
SELECT
    p1.id,
    p1.playlist_name,
    p2.playlist_name AS parent_playlist_name
FROM Playlists AS p1
LEFT JOIN Playlists AS p2
    ON p1.parent_playlist_id = p2.id;
    
/*
3. Given three tables: Users (id, username), Orders (id, user_id, order_date), and Payments (id, order_id, amount), 
write a SQL query using multiple JOINs to display each username, their order date, and payment amount, showing all users even if they have no orders or payments.
*/

CREATE TABLE Users (
    id INT PRIMARY KEY,
    username VARCHAR(100)
);

CREATE TABLE Orders_join (
    id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Payments (
    id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders_join(id)
);

INSERT INTO Users VALUES
(1, 'Vishnu'),
(2, 'Rahul'),
(3, 'Priya'),
(4, 'Neha');

INSERT INTO Orders_join VALUES
(101, 1, '2026-07-01'),
(102, 1, '2026-07-05'),
(103, 2, '2026-07-08');

INSERT INTO Payments VALUES
(1, 101, 500.00),
(2, 102, 750.00);

SELECT 
    u.username, o.order_date, p.amount
FROM
    Users u
        LEFT JOIN
    Orders_join o ON u.id = o.user_id
        LEFT JOIN
    Payments p ON o.id = p.order_id;
    
/*
4. You notice that your JOIN query between Zomato's Restaurants and Reviews tables is returning duplicate rows for some restaurants. 
Modify your query to eliminate duplicates and explain in one line why the duplicates were happening.
<br><br><em><strong>Hint:</strong> Use DISTINCT or GROUP BY and consider the relationship between restaurants and reviews.</em>
*/

SELECT DISTINCT
    r.id,
    r.name,
    r.city
FROM Restaurants r
JOIN Reviews rv
    ON r.id = rv.restaurant_id;
    
/*
5. Write two different JOIN queries on a Products and Categories table (like Flipkart) to list all products with their category names, 
but use different join conditions in each. 
Briefly explain which join condition is more efficient and why.
*/    

-- Join Using IDs
SELECT
    p.product_name,
    c.category_name
FROM Products p
JOIN Categories c
    ON p.category_id = c.id;
    
-- Join Using Category Names    
SELECT
    p.product_name,
    c.category_name
FROM Products p
JOIN Categories c
    ON p.category_name = c.category_name;