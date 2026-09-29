# Physical Database
## Description of Concepts
- What information should be included in a create table statement
    - Table name
    - PK
    - Other columns and foreign keys
    - Constraints
    - Column datatypes
    - Nullability
- What are database constraints and what are the benefits of them
    - Database constraints enforce rules of data values during inerts, updates, or deletions. They can be used to help ensure your data remains clean and reliable. With constraints, you can at least be sure your data always takes a certain form.
- Ways to insert data
    - SQL insert command
    - DBMS Tools
- What are database roles and what are they used for
    - Roles define a collection of privileges that a user has. Using these, you can give users a role that defines what they can and cannot do in the database.
- Different type of users
    - DBA
    - Naive Users
    - Systems Analyst
    - Sophisticated Users
    - DB Designers
    - Programmers
    - Casual Users
    - Specialized Users

## Group Physical Model
[Group Physical Model](https://github.com/AMcGohan/cs4900-EmberLights-Database/tree/main/physical_model)

## Table Scripts
```
-- Create the album table if it doesn't exist
CREATE TABLE IF NOT EXISTS Albums (
    albumID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    albumName VARCHAR(100) NOT NULL,
    artistName VARCHAR(60) NOT NULL
);

-- Genre lookup table
CREATE TABLE IF NOT EXISTS Genres (
    genreID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    genreName VARCHAR(50) NOT NULL
);

-- Songs table, references genre and album.
CREATE TABLE IF NOT EXISTS Songs (
    songID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    songName VARCHAR(100) NOT NULL,
    genreID INT NOT NULL,
    songDuration TIME NOT NULL CHECK (songDuration > '00:00:00'),
    albumID INT NOT NULL,

    CONSTRAINT fk_songs_genre --Reference Genres
        FOREIGN KEY (genreID)
        REFERENCES Genres(genreID)
        ON DELETE RESTRICT,
    CONSTRAINT fk_songs_albums --Reference Albums
        FOREIGN KEY (albumID)
        REFERENCES Albums(albumID)
        ON DELETE CASCADE
);

-- Playlists Table, references genre
CREATE TABLE IF NOT EXISTS Playlists (
    playlistID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    playlistName VARCHAR(50) NOT NULL,
    genreID INT NOT NULL,
    creationTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    numberSongs TINYINT NOT NULL DEFAULT 10 CHECK (numberSongs >= 0), --the number of songs that the playlist contains. This is fixes, not a running count. 

    CONSTRAINT fk_playlists_genre --Reference Genres
        FOREIGN KEY (genreID)
        REFERENCES Genres(genreID)
        ON DELETE RESTRICT
);

-- the intermediary table for Playlist and Songs many to many
-- References Playlists and Songs
CREATE TABLE IF NOT EXISTS PlaylistSongs (
    playlistID INT NOT NULL,
    songID INT NOT NULL,

    primary key (playlistID, songID), --Composite key
    
    CONSTRAINT fk_playlistsongs_playlists --Reference Playlists
        FOREIGN KEY (playlistID)
        REFERENCES Playlists(playlistID)
        ON DELETE CASCADE,
    CONSTRAINT fk_playlistsongs_songs --Reference Songs
        FOREIGN KEY (songID)
        REFERENCES Songs(songID)
        ON DELETE CASCADE
);
```

Create the five tables from the physical model. References foreign keys, enforces datatypes, and sets up check constraints. 
IDs take the form of auto incremented integers. If a playlist or song is deleted, then the entries placing that song in the playlist or
songs in that playlist will be deleted as well. However, a genre cannot be deleted so long as there are Playlists or Songs still
referencing it. 