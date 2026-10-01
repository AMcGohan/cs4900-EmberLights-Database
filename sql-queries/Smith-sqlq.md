# Questions

## What is a SQL query?
A SQL query is how a user will access and change the data that is stored within our database.  This can be grab multiple data points from many tables and can filter what you see or store multiple data points.
## Describe the parts of a SELECT statement
The basic example of a select statement is
```
SELECT COLUMN 
FROM TABLE_NAME
```
You can search for multiple columns by seperating them with a comma
```
SELECT COL1,COL2 
FROM TABLE_NAME
```
## Describe how to filter a query
To filter our queries one option we have is to add a WHERE clause
```
SELECT COLUMN 
FROM TABLE_NAME
WHERE CONDITION
```
This will only grab rows from the column that meet the condition put in the where  

Additionally you can sort your rows using commands like ORDER BY or GROUP BY
```
SELECT COLUMN 
FROM TABLE_NAME
ORDER BY COLUMN ASC 
```
## What are database indexes and what are the benefits of them
A database index is a data structure that is used to find values in a column quicker.  This is very useful for a table that doesn't get updated that much as tables that are indexed take longer to update. But if that table needs to be searched a lot then the speed at which a indexed table can be searched is much faster than a normal table.
# Models

## Physical
Our physical model can be found [here](../physical_model/README.md)

# SQL Queries
```
SELECT * FROM Songs
JOIN Genres ON Songs.genreID = Genres.genreID
WHERE Genres.genreName = "Country";
```
This query can be used to find all of the songs in our data base that are labeled under the country genre

```
SELECT COUNT(*) FROM Songs
JOIN Genres ON Songs.genreID = Genres.genreID
WHERE Genres.genreName = "Country";
```
This one could be used if the user wants to know how many songs of a genre we have on our sie.

```
SELECT COUNT(*) FROM Playlists;
```
This cna be used to find out the number of playlist that a user has

```
SELECT Albums.artistName,Songs.songName FROM Songs
JOIN Albums ON Songs.albumID = Albums.albumID;
```
This query can be used to see every song and its artist

```
SELECT Songs.songName, Playlists.playlistName FROM Songs
JOIN PlaylistSongs ON Songs.songID = PlaylistSongs.songID
JOIN Playlists ON PlaylistSongs.playlistID = Playlists.playlistID;
```
This query can get every song and what playlist it is in

```
SELECT songName FROM Songs
JOIN PlaylistSongs ON Songs.songID = PlaylistSongs.songID
JOIN Playlists ON PlaylistSongs.playlistID = Playlists.playlistID
WHERE Playlists.playlistName = "playlist 1";
```
This query can show every song that is in a specific playlist name

```
SELECT songName FROM Songs
JOIN PlaylistSongs ON Songs.songID = PlaylistSongs.songID
JOIN Playlists ON PlaylistSongs.playlistID = Playlists.playlistID
WHERE Playlists.playlistID = 1;
```
This one will only grab a specific playlist and not all with the same name

```
SELECT songName, songDuration FROM Songs
ORDER BY songDuration ASC;
```
This will sort all songs by song length shortest to longest

```
SELECT songName FROM Songs
JOIN PlaylistSongs ON Songs.songID = PlaylistSongs.songID
JOIN Playlists ON PlaylistSongs.playlistID = Playlists.playlistID
WHERE Playlists.playlistID = 1
ORDER BY songDuration ASC;
```
This will sort a specific playlist songs by length