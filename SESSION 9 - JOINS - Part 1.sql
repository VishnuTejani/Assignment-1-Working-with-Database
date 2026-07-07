USE music_streaming_app;

/*
1. Create two tables in your database: 'restaurants' (id, name, city) and 'dishes' (id, restaurant_id, dish_name, price). 
Insert at least 3 restaurants and 2-3 dishes for each restaurant.
*/

CREATE TABLE restaurants_in (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE dishes_in (
    id INT PRIMARY KEY,
    restaurant_id INT,
    dish_name VARCHAR(100),
    price DECIMAL(8,2)
);

INSERT INTO restaurants_in VALUES
(1, 'Spice Villa', 'Ahmedabad'),
(2, 'Pizza Hub', 'Surat'),
(3, 'Royal Biryani', 'Vadodara'),
(4, 'Food Corner', 'Rajkot');

INSERT INTO dishes_in VALUES
(1, 1, 'Paneer Butter Masala', 280.00),
(2, 1, 'Butter Naan', 40.00),
(3, 2, 'Margherita Pizza', 350.00),
(4, 2, 'Garlic Bread', 180.00),
(5, 3, 'Chicken Biryani', 320.00),
(6, 3, 'Veg Biryani', 250.00),
(7, 99, 'Mystery Dish', 150.00); 

/*
2. Write an SQL INNER JOIN query to display each dish along with its restaurant name and city, similar to how Zomato shows dish details with the restaurant info.
*/

SELECT 
    d.dish_name, d.price, r.name AS restaurant_name, r.city
FROM
    dishes_in d
        INNER JOIN
    restaurants_in r ON d.restaurant_id = r.id;

/*
3. Write an SQL LEFT JOIN query to list all restaurants and their dishes, showing restaurants even if they currently have no dishes on the menu.
<br><br><em><strong>Hint:</strong> Use LEFT JOIN so restaurants without dishes still appear in the results with NULL for dish columns.</em>
*/

SELECT 
    r.name AS restaurant_name, r.city, d.dish_name, d.price
FROM
    restaurants_in r
        LEFT JOIN
    dishes_in d ON r.id = d.restaurant_id;

/*
4. Write an SQL RIGHT JOIN query to display all dishes and their restaurant names, including any dishes that might not be linked to a restaurant 
(simulate a data error where a dish has a restaurant_id that doesn't match any restaurant).
*/

SELECT 
    d.dish_name, d.price, r.name AS restaurant_name, r.city
FROM
    restaurants_in r
        RIGHT JOIN
    dishes_in d ON r.id = d.restaurant_id;
    
/*
5. Given this scenario: You want to show a list of all playlists and the songs inside them, like Spotify. 
Explain which JOIN type (INNER, LEFT, or RIGHT) you would use to show all playlists, even if some are empty, and write the SQL query for it.
*/
    
SELECT 
    p.playlist_name, s.song_name, s.artist
FROM
    playlists p
        LEFT JOIN
    songs s ON p.playlist_id = s.playlist_id;