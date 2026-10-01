-- Gonzalez SQL Queries


-- Query 1: Find Songs by Artist

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


-- Query 2: Number of Songs by Genre

SELECT Genres.genreName,
       COUNT(Songs.songID) AS NumberOfSongs
FROM Genres
LEFT JOIN Songs ON Genres.genreID = Songs.genreID
GROUP BY Genres.genreID, Genres.genreName
ORDER BY NumberOfSongs DESC;


-- Query 3: Find Playlists Containing an Artist

SELECT DISTINCT Playlists.playlistName,
                Albums.artistName
FROM PlaylistSongs
JOIN Playlists ON PlaylistSongs.playlistID = Playlists.playlistID
JOIN Songs ON PlaylistSongs.songID = Songs.songID
JOIN Albums ON Songs.albumID = Albums.albumID
WHERE Albums.artistName = 'Journey';
