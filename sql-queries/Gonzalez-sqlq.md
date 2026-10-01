# Gonzalez - SQL Business Queries

## SQL Concepts

### SQL Query

A SQL query is an instruction used to retrieve or work with data stored in a database. The `SELECT` statement is commonly used when information needs to be retrieved from one or more tables.

### SELECT Statement

A basic SELECT statement is made up of different clauses:

- `SELECT` chooses the columns to display.
- `FROM` specifies the table where the data comes from.
- `WHERE` limits the results using a condition.
- `JOIN` can be used when information from multiple related tables is needed.

### Query Filtering

Queries can be filtered using the `WHERE` clause. For example:

```sql
WHERE Albums.artistName = 'Metallica';
```

This would only return records where the artist is Metallica.

### Database Indexes

Indexes help the database find information faster without searching through every row in a table. They improve query performance, especially with larger amounts of data. However, inserts and updates can take slightly longer because the indexes also need to be updated.

---

## Project References

**Physical Model:**  
[EmberLights Group Physical Model](https://github.com/AMcGohan/cs4900-EmberLights-Database/tree/main/physical_model)

**Database Initialization Scripts:**  
[EmberLights DB Init](https://github.com/AMcGohan/cs4900-EmberLights-Database/tree/main/db_init_scripts)

---

## Business Queries

### 1. Find Songs by Artist

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

### 2. Number of Songs by Genre

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

### 3. Find Playlists Containing an Artist

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
