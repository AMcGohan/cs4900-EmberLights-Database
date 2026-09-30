USE Emberlights_DB;

CREATE TABLE IF NOT EXISTS Albums (
    albumID     INT     PRIMARY KEY     AUTO_INCREMENT  NOT NULL,
    albumName   VARCHAR(100)                            NOT NULL,
    artistName  VARCHAR(60)                             NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
    genreID     INT         PRIMARY KEY AUTO_INCREMENT  NOT NULL,
    genreName   VARCHAR(50)                             NOT NULL
);

CREATE TABLE IF NOT EXISTS Songs (
    songID          INT     PRIMARY KEY     AUTO_INCREMENT  NOT NULL,
    songName        VARCHAR(100)                            NOT NULL,
    genreID         INT                                     NOT NULL,
    songDuration    TIME                                    NOT NULL    CHECK (songDuration > '00:00:00'),
    albumID         INT                                     NOT NULL,

    CONSTRAINT fk_songs_genre
        FOREIGN KEY (genreID)
        REFERENCES  Genres(genreID)
        ON DELETE   RESTRICT,
    CONSTRAINT      fk_songs_albums
        FOREIGN KEY (albumID)
        REFERENCES  Albums(albumID)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Playlists (
    playlistID      INT     PRIMARY KEY     AUTO_INCREMENT  NOT NULL,
    playlistName    VARCHAR(50)                             NOT NULL,
    genreID         INT                                     NOT NULL,
    creationTime    DATETIME                                NOT NULL    DEFAULT CURRENT_TIMESTAMP,
    numberSongs     TINYINT NOT NULL                                    DEFAULT 10                  CHECK (numberSongs >= 0),

    CONSTRAINT fk_playlists_genre
        FOREIGN KEY (genreID)
        REFERENCES Genres(genreID)
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS PlaylistSongs (
    playlistID  INT     NOT NULL,
    songID      INT     NOT NULL,

    primary key (playlistID, songID),
    CONSTRAINT fk_playlistsongs_playlists
        FOREIGN KEY (playlistID)
        REFERENCES Playlists(playlistID)
        ON DELETE CASCADE,
    CONSTRAINT fk_playlistsongs_songs
        FOREIGN KEY (songID)
        REFERENCES Songs(songID)
        ON DELETE CASCADE
);