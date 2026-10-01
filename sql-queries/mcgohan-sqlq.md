# McGohan SQL Queries

## What is a SQL Query?

A SQL Query is a command used to either retrieve, update, insert, or delete rows in a database.

## Parts of a SELECT Statement and How to Filter Data

```sql
SELECT * FROM Albums ORDER BY albumName;
```

In the above example: 
* `SELECT` is retrieving all attributes
* `FROM` is selecting which table to receive the data from
* `ORDER BY` is sorting the data based on an attribute in ascending order

Hypothetically, if I were a frontend user that wanted to view all albums created by a certain artist, I would use a search bar to filter out albums that do not share the artist I want. That is where the `WHERE` clause comes in.

```sql
SELECT * FROM Albums WHERE artistName = 'The Beatles' ORDER BY albumName;
```

In the above example, I wanted to view all albums that were created by `The Beatles`. The `WHERE` clause will filter out data where the artist of an album is NOT `The Beatles`.

## What are Database Indexes and Their Benefits

Indexes make SQL queries more efficient by reducing the number of disk accesses to find rows that match.

For example, `B-Tree Indexes` stores data in a sorted order. This makes queries based on range efficient.

## SQL Queries

[Link to Physical Model](../physical_model/README.md)

```sql
-- Inserting a Song
-- GenreID '3' == 'Rock'
INSERT INTO Songs (songName, genreID, songDuration, albumID)
VALUES ('Lucy In The Sky With Diamonds', 3, '00:03:29', 432);

-- Inserting a Genre
INSERT INTO Genres (genreName)
VALUES ('Rock');

-- Inserting a Playlist
-- GenreID '3' == 'Rock'
INSERT INTO Playlists (playlistName, genreID, numberSongs)
VALUES ('Playlist based on The Beatles', 3, 50);

-- Retrieving all songs, the songs artist, and the album the song belongs to and their duration in a given Playlist ID

-- SQL Query joins PlaylistSongs, Playlists, and Albums tables together by their Primary/Foreign Keys, then selects attributes from Songs and Albums
SELECT Songs.songName, Songs.songDuration, Albums.albumName, Albums.artistName
FROM Songs
JOIN PlaylistSongs ON Songs.songID = PlaylistSongs.songID
JOIN Playlists ON PlaylistSongs.playlistID = playlist.playlistID
JOIN Albums on Songs.albumID = Albums.albumID
WHERE PlaylistSongs.playlistID = 1
```