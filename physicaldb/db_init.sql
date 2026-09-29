-- 1. Albums: Stores album and artist information.

CREATE TABLE IF NOT EXISTS Albums (
    albumID INT NOT NULL AUTO_INCREMENT,
    albumName VARCHAR(100) NOT NULL,
    artistName VARCHAR(60) NOT NULL,

    PRIMARY KEY (albumID)
);

-- 2. Genres: Stores the available music genres.

CREATE TABLE IF NOT EXISTS Genres (
    genreID INT NOT NULL AUTO_INCREMENT,
    genreName VARCHAR(50) NOT NULL,

    PRIMARY KEY (genreID)
);

-- 3. Songs: Stores songs and connects them to albums and genres.

CREATE TABLE IF NOT EXISTS Songs (
    songID INT NOT NULL AUTO_INCREMENT,
    songName VARCHAR(100) NOT NULL,
    genreID INT NOT NULL,
    songDuration TIME NOT NULL,
    albumID INT NOT NULL,

    PRIMARY KEY (songID),

    CONSTRAINT chk_song_duration
        CHECK (songDuration > '00:00:00'),

    CONSTRAINT fk_song_genre
        FOREIGN KEY (genreID)
        REFERENCES Genres(genreID)
        ON DELETE RESTRICT,

    CONSTRAINT fk_song_album
        FOREIGN KEY (albumID)
        REFERENCES Albums(albumID)
        ON DELETE CASCADE
);

-- 4. Playlists: Stores playlist information and its genre.

CREATE TABLE IF NOT EXISTS Playlists (
    playlistID INT NOT NULL AUTO_INCREMENT,
    playlistName VARCHAR(50) NOT NULL,
    genreID INT NOT NULL,
    creationTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    numberSongs TINYINT NOT NULL DEFAULT 10,

    PRIMARY KEY (playlistID),

    -- numberSongs is a fixed value, not an automatic counter.
    CONSTRAINT chk_playlist_songs
        CHECK (numberSongs >= 0),

    CONSTRAINT fk_playlist_genre
        FOREIGN KEY (genreID)
        REFERENCES Genres(genreID)
        ON DELETE RESTRICT
);

-- 5. PlaylistSongs: Connects playlists and songs.
-- The composite primary key prevents duplicate combinations.

CREATE TABLE IF NOT EXISTS PlaylistSongs (
    playlistID INT NOT NULL,
    songID INT NOT NULL,

    PRIMARY KEY (playlistID, songID),

    CONSTRAINT fk_ps_playlist
        FOREIGN KEY (playlistID)
        REFERENCES Playlists(playlistID)
        ON DELETE CASCADE,

    CONSTRAINT fk_ps_song
        FOREIGN KEY (songID)
        REFERENCES Songs(songID)
        ON DELETE CASCADE
);
