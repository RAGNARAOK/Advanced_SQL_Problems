-- Problem Link: https://datalemur.com/questions/top-fans-rank
-- Assume there are three Spotify tables: artists, songs, and global_song_rank,
-- which contain information about the artists, songs, and music charts, respectively.
-- Write a query to find the top 5 artists whose songs appear most frequently in the 
-- Top 10 of the global_song_rank table. Display the top 5 artist names in ascending order, along with their song appearance ranking.
-- If two or more artists have the same number of song appearances, they should be assigned 
-- the same ranking, and the rank numbers should be continuous (i.e. 1, 2, 2, 3, 4, 5)

WITH filtering AS (
  SELECT s.artist_id, COUNT(*) AS song_appearance_count
  FROM global_song_rank g
  JOIN songs s ON g.song_id = s.song_id
  WHERE g.rank <= 10
  GROUP BY s.artist_id
),
ranking AS (
  SELECT artist_id, song_appearance_count,
         DENSE_RANK() OVER (ORDER BY song_appearance_count DESC) AS artist_rank
  FROM filtering
)
SELECT a.artist_name, r.artist_rank
FROM ranking r
JOIN artists a ON r.artist_id = a.artist_id
WHERE r.artist_rank <= 5
ORDER BY r.artist_rank;
