-- songs in a playlist (Change where clause to switch playlists)
SELECT Playlists.playlistName, Songs.songName, Songs.songDuration, Albums.albumName, Albums.artistName, Genres.genreName 
FROM PlaylistSongs
JOIN Songs on PlaylistSongs.songID = Songs.songID
JOIN Playlists on PlaylistSongs.playlistID = Playlists.playlistID
JOIN Albums on Songs.albumID = Albums.albumID
JOIN Genres on Songs.genreID = Genres.genreID 
WHERE PlaylistSongs.playlistID = 1;