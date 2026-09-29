CREATE DATABASE music_app;

USE music_app;

CREATE TABLE Albums(
    albumID int AUTO_INCREMENT NOT NULL,
    albumName varchar(100) NOT NULL,
    artistName varchar(60) NOT NULL,
    PRIMARY KEY(album_id)
);

CREATE TABLE Songs(
    songID int AUTO_INCREMENT NOT NULL,
    genreID int NOT NULL,
    albumID int NOT NULL,
    songName varchar(100) NOT NULL,
    songDuration time NOT NULL,
    PRIMARY KEY(songID),
    FOREIGN KEY(genreID)
        REFERENCES Genres(genreID),
    FOREIGN KEY(albumID)
        REFERENCES Albums(albumID)
);

CREATE TABLE PlaylistSongs(
    playlistID int AUTO_INCREMENT NOT NULL,
    songID int NOT NULL,
    FOREIGN KEY (playlistID)
        REFERENCES Playlists(playlistID),
    FOREIGN KEY (songID)
        REFERENCES Songs(songID)
);

CREATE TABLE Playlists(
    playlistID int AUTO_INCREMENT NOT NULL,
    genreID int NOT NULL,
    playlistName varchar(50) NOT NULL,
    numberSongs tinyint NOT NULL,
    creationTime DATETIME DEFAULT CURRENT_TIME NOT NULL,
    PRIMARY KEY (playlistID),
    FOREIGN KEY (genreID)
        REFERENCES Genres(genreID)
);

CREATE TABLE Genres(
    genreID int AUTO_INCREMENT NOT NULL,
    genreName varchar(50) NOT NULL,
    PRIMARY KEY (genreID)
);