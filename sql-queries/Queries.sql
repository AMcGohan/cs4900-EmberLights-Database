-- songs in a playlist (Change where clause to switch playlists)
SELECT Playlists.playlistName, Songs.songName, Songs.songDuration, Albums.albumName, Albums.artistName, Genres.genreName 
FROM PlaylistSongs
JOIN Songs on PlaylistSongs.songID = Songs.songID
JOIN Playlists on PlaylistSongs.playlistID = Playlists.playlistID
JOIN Albums on Songs.albumID = Albums.albumID
JOIN Genres on Songs.genreID = Genres.genreID 
WHERE PlaylistSongs.playlistID = 2; -- or desired playlist

-- Songs in an album
SELECT Albums.albumName, Songs.songName, Songs.songDuration, Genres.genreName 
FROM Songs
JOIN Albums on Songs.albumID = Albums.albumID 
JOIN Genres on Songs.genreID = Genres.genreID 
WHERE Songs.albumID = 3; -- or desired album

-- Playlist Duration
SELECT Playlists.playlistName, SEC_TO_TIME(SUM(TIME_TO_SEC(Songs.songDuration))) as PlaylistDuration
FROM PlaylistSongs
JOIN Songs ON PlaylistSongs.songID = Songs.songID 
JOIN Playlists ON PlaylistSongs.playlistID = Playlists.playlistID 
WHERE PlaylistSongs.playlistID = 1