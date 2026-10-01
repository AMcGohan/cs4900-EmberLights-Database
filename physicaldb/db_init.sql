CREATE TABLE Album (
    albumID INT PRIMARY KEY AUTO_INCREMENT,
    albumName VARCHAR(100) NOT NULL,
    artistName varchar(60) NOT NULL
);

CREATE TABLE Genre (
    genreID INT PRIMARY KEY AUTO_INCREMENT,
    genreName VARCHAR(50) NOT NULL,
);

CREATE TABLE Playlist (
    playlistID INT PRIMARY KEY AUTO_INCREMENT,
    playlistName VARCHAR(50) NOT NULL,
    creationTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    numberSongs TINYINT NOT NULL  DEFAULT 10 CHECK (numberSongs >= 0),
    genreID INT,
    FOREIGN KEY (genreID) REFERENCES Genre(genreID)
);

CREATE TABLE Song (
    songID INT PRIMARY KEY AUTO_INCREMENT,
    songName VARCHAR(100) NOT NULL,
    songDuration TIME NOT NULL CHECK(songDuration > '00:00:00'),
    genreID INT,
    albumID INT,
    FOREIGN KEY (genreID) REFERENCES Genre(genreID),
    FOREIGN KEY (albumID) REFERENCES Album(albumID)
);

CREATE TABLE PlaylistSongs (
    songID INT,
    playlistID INT,
    PRIMARY KEY(songID, playlistID),
    FOREIGN KEY (songID) REFERENCES Song(songID),
    FOREIGN KEY (playlistID) REFERENCES Playlist(playlistID)
);
```
The first table that I created is the Album table
```
CREATE TABLE Album (
    albumID INT PRIMARY KEY AUTO_INCREMENT,
    albumName VARCHAR(100) NOT NULL,
    artistName varchar(60) NOT NULL
);