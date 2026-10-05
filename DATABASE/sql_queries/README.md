# Group Database Queries
## Group Physical Model
[Group Physical Model](https://github.com/AMcGohan/cs4900-EmberLights-Database/tree/main/physical_model)

## Group DB_Init
[Group DB Init](https://github.com/AMcGohan/cs4900-EmberLights-Database/tree/main/db_init_scripts)

## Queries

### Business Questions

* [How do I retrieve all songs that are included in a user-created playlist?](#get-songs-in-a-specific-playlist)

* [How do I retrieve all songs that are included in a specific album?](#get-songs-in-a-specific-album)

* [How do I retrieve the total duration of a playlist?](#get-total-duration-of-a-playlist)

* [How do I retrieve all songs in a playlist sorted by the song duration?](#sort-playlist-songs-by-duration)

* [How do I retrieve the number of all user-created playlists?](#display-number-of-playlist-a-user-has-made)

* [How do I retrieve all songs created by a specific artist?](#find-songs-by-artist)

* [How do I retrieve the number of songs that belong to a specific genre?](#number-of-songs-by-genre)

* [How do I retrieve all playlists that contain at least one song from a specific artist?](#number-of-songs-by-genre)

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
WHERE PlaylistSongs.playlistID = 1 -- or desired playlist
```

Selects a playlist from the playlistSongs table and joins in Playlists to get the name of the playlist and Songs to get the duration value. Then, it converts the song duration to seconds so it can be summed cleanly. Then it converts the duration back to a time and displays it as PlaylistDuration.

Tells you the total duration of a playlist. 

### Sort playlist songs by duration
```
SELECT songName FROM Songs
JOIN PlaylistSongs ON Songs.songID = PlaylistSongs.songID
JOIN Playlists ON PlaylistSongs.playlistID = Playlists.playlistID
WHERE Playlists.playlistID = 1
ORDER BY songDuration ASC;
```
This join statement will look at a playlist and grab all of the songs from it and sort the songs in it by their duration

### Display number of playlist a user has made
```
SELECT COUNT(*) FROM Playlists;
```
This can be used to find out the number of playlist that a user has


### Find Songs by Artist

This query can be used to search the music library for songs belonging to a specific artist.

```sql
SELECT Albums.artistName,
       Albums.albumName,
       Songs.songName,
       Songs.songDuration,
       Genres.genreName
FROM Songs
JOIN Albums ON Songs.albumID = Albums.albumID
JOIN Genres ON Songs.genreID = Genres.genreID
WHERE Albums.artistName = 'Metallica'
ORDER BY Albums.albumName, Songs.songName;
```

The query connects `Songs`, `Albums`, and `Genres`. It filters the results by artist and displays useful information about each song.

---

### Number of Songs by Genre

This query shows how many songs are stored for each genre.

```sql
SELECT Genres.genreName,
       COUNT(Songs.songID) AS NumberOfSongs
FROM Genres
LEFT JOIN Songs ON Genres.genreID = Songs.genreID
GROUP BY Genres.genreID, Genres.genreName
ORDER BY NumberOfSongs DESC;
```

The `COUNT` function calculates the number of songs in each genre. `GROUP BY` separates the songs by genre and the results are ordered from highest to lowest.

---

### Find Playlists Containing an Artist

This query finds playlists that contain at least one song from a selected artist.

```sql
SELECT DISTINCT Playlists.playlistName,
                Albums.artistName
FROM PlaylistSongs
JOIN Playlists ON PlaylistSongs.playlistID = Playlists.playlistID
JOIN Songs ON PlaylistSongs.songID = Songs.songID
JOIN Albums ON Songs.albumID = Albums.albumID
WHERE Albums.artistName = 'Journey';
```

The query follows the relationships between `PlaylistSongs`, `Playlists`, `Songs`, and `Albums`. `DISTINCT` prevents the same playlist from appearing more than once.
