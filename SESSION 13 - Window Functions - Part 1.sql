USE music_streaming_app;

/*
1. Create a table named Playlists with columns: id, user_id, playlist_name, and total_likes. 
Insert at least 8 sample rows with different users and playlists, making sure some playlists have the same user_id.
*/

CREATE TABLE playlists_wf (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    total_likes INT
);
INSERT INTO playlists_wf VALUES
(1, 101, 'Workout Beats', 950),
(2, 101, 'Morning Chill', 720),
(3, 101, 'Party Mix', 950),
(4, 102, 'Romantic Hits', 860),
(5, 102, 'Travel Songs', 640),
(6, 103, 'Lo-Fi Study', 1200),
(7, 103, 'Night Drive', 780),
(8, 103, 'Old Classics', 1200);

/*
2. Write a SQL query using ROW_NUMBER() and the OVER() clause to assign a unique row number to each playlist, ordered by total_likes in descending order.
*/

SELECT 
	*, ROW_NUMBER() OVER(ORDER BY total_likes DESC) 
FROM 
	playlists_wf;

/*
3. Use the RANK() function with the OVER() clause to rank all playlists by total_likes, and display the playlist_name, user_id, total_likes, and their rank.
*/

SELECT 
	*, RANK() OVER(order by total_likes) 
FROM 
	playlists_wf;

/*
4. Write a SQL query using DENSE_RANK() and PARTITION BY user_id to rank each user's playlists by total_likes, showing playlist_name, user_id, total_likes, and dense rank.
<br><br><em><strong>Hint:</strong> This will show how popular each playlist is within each user's account, similar to how Spotify might rank your top playlists.</em>
*/

SELECT 
	*, DENSE_RANK() OVER(PARTITION BY user_id ORDER BY total_likes DESC) 
FROM 
	playlists_wf;

/*
5. Imagine you want to show the top 2 playlists per user based on total_likes, like Spotify's 'Your Top Playlists' feature. 
Write a query using a window function to select only the top 2 playlists for each user.
*/

SELECT
	*
FROM
	(SELECT 
		*, DENSE_RANK() OVER(PARTITION BY user_id ORDER BY total_likes DESC) AS TOP2
	FROM 
		playlists_wf) AS TB WHERE TOP2 <=2;