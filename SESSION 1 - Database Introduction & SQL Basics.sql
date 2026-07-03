-- SESSION 1 -Database Introduction & SQL Basics

-- 1. Install MySQL or PostgreSQL on your system and create a new database named 'music_streaming_app' using the command line or GUI tool of your choice.

CREATE DATABASE music_streaming_app;

-- 2. Inside the 'music_streaming_app' database, create a table called 'playlists' with columns: playlist_id (integer, primary key), name (varchar), and created_by (varchar).

use music_streaming_app;

CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY,
    name VARCHAR(255),
    created_by VARCHAR(255)
);

-- 3. Insert three sample rows into the 'playlists' table representing playlists like 'Bollywood Hits', 'Chill Vibes', and 'Workout Mix', each created by a different user.

INSERT INTO playlists VALUES (1, "Bollywood Hits", "Amit"), (2, "Chill Vibes", "Priya"), (3, "Workout Mix", "Rahul");

-- 4. Write an SQL SELECT query to display all playlists created by the user 'Amit' from the 'playlists' table.
--    <br><br><em><strong>Hint:</strong> Use the WHERE clause to filter by the 'created_by' column.</em>

SELECT 
    *
FROM
    playlists
WHERE
    created_by = 'Amit';
    
/*5. Open ChatGPT or Copilot and ask it to explain the difference between a table, a row, and a column in SQL using an example from a food delivery app like Zomato. 
Paste the explanation you receive into your assignment.*/    
    
/*
In SQL, a **table** is a collection of related data organized into rows and columns. 
For example, in a food delivery app like Zomato, there could be a table called **Restaurants** that stores information about all restaurants.

A **row** (also called a record) represents one complete entry in the table. For example, 
one row in the **Restaurants** table might contain the details of a single restaurant:

| Restaurant_ID | Restaurant_Name | City      | Rating |
| ------------- | --------------- | --------- | ------ |
| 101           | Pizza Hub       | Ahmedabad | 4.5    |

This entire record is one row.

A **column** represents a specific attribute or type of information stored in the table. 
In the example above, **Restaurant_ID**, **Restaurant_Name**, **City**, and **Rating** are the columns. Each column stores the same type of information for every restaurant.

**Summary:**

* **Table** = A collection of related data (e.g., the **Restaurants** table).
* **Row** = One complete record in the table (e.g., Pizza Hub's details).
* **Column** = One category of information (e.g., Restaurant_Name or Rating).
*/