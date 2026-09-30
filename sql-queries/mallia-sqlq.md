# Database Queries - Mallia
## Common Concepts
- What is a SQL Query?
    - A SQL Query uses Structured Query Language to access data from a database. SQL allows you to specify what data you want, perform certain operations on that data, and get data back. SELECT is usually the method of choice to query a database. 
- Describe the Parts of a SELECT Statement
    - SELECT defines what you want to get, FROM is where you want to get it from, WHERE is a filter to limit results to only those which you want to see. 
    - Also commonly accompanied with JOINS which combine two tables based on a condition, usually the equality of a foreign key to its referenced key. 
- Descript how to filter a query
    - Use the WHERE clause at the end of your query. For example, to limit results to only those in the album named "MyAlbum" you could say: `WHERE Albums.albumName = "MyAlbum"`
- What are database indexes and what are the benefits of them
    - Normally a query would search a column linearly. Indexes add a logical structure to a column that allows for more efficient searching of a column. However, now the database must ensure that the structure is preserved upon update. So indexes result in faster searches but longer updates and insertions.

## Group Physical Model
[Group Physical Model](https://github.com/AMcGohan/cs4900-EmberLights-Database/tree/main/physical_model)

## Group DB_Init
[Group DB Init](https://github.com/AMcGohan/cs4900-EmberLights-Database/tree/main/db_init_scripts)

## Queries
### Get Songs in a Specific Playlist
```
-- songs in a playlist (Change where clause to switch playlists)
SELECT Playlists.playlistName, Songs.songName, Songs.songDuration, Albums.albumName, Albums.artistName, Genres.genreName 
FROM PlaylistSongs
JOIN Songs on PlaylistSongs.songID = Songs.songID
JOIN Playlists on PlaylistSongs.playlistID = Playlists.playlistID
JOIN Albums on Songs.albumID = Albums.albumID
JOIN Genres on Songs.genreID = Genres.genreID 
WHERE PlaylistSongs.playlistID = 2; -- or desired playlist
```

Selects information relevant to identifying the playlist and a summary of a song. Joing the Songs table to get song summary, the playlist table to get the playlist name, the albums table for the album name, and the genres table for the genre name. Then it filters it to only give the desired playlist.

Tells you all the songs in a playlist. 

### Get Songs in a Specific Album
```
-- Songs in an album
SELECT Albums.albumName, Songs.songName, Songs.songDuration, Genres.genreName 
FROM Songs
JOIN Albums on Songs.albumID = Albums.albumID 
JOIN Genres on Songs.genreID = Genres.genreID 
WHERE Songs.albumID = 3; -- or desired album
```

Selects information relevant to a song and what album it is in. First selects the Songs table for general summary data, joins the Albums table for album name and artist name, and joins the Genres table for the genre name. 

Lists every song in an album. 

### Get Total Duration of a Playlist
```
-- Playlist Duration
SELECT Playlists.playlistName, SEC_TO_TIME(SUM(TIME_TO_SEC(Songs.songDuration))) as PlaylistDuration
FROM PlaylistSongs
JOIN Songs ON PlaylistSongs.songID = Songs.songID 
JOIN Playlists ON PlaylistSongs.playlistID = Playlists.playlistID 
WHERE PlaylistSongs.playlistID = 1
```

Selects a playlist from the playlistSongs table and joins in Playlists to get the name of the playlist and Songs to get the duration value. Then, it converts the song duration to seconds so it can be summed cleanly. Then it converts the duration back to a time and displays it as PlaylistDuration.

Tells you the total duration of a playlist. 