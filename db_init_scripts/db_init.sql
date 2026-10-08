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
        ON DELETE RESTRICT
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
        ON DELETE RESTRICT,
    CONSTRAINT fk_playlistsongs_songs
        FOREIGN KEY (songID)
        REFERENCES Songs(songID)
        ON DELETE RESTRICT
);


INSERT INTO Genres (genreName) VALUES 
    ( 'Rock' ),
    ( 'Pop' ),
    ( 'Metal' ),
    ( 'Folk' );

INSERT INTO Albums (albumName, artistName) VALUES
    ( "Seperate Ways",      "Journey" ),
    ( "Bones in the Ocean", "The Longest Johns"),
    ( "Master of Puppets",  "Metallica"),
    ( "True Colors",        "Cyndi Lauper"),
    ( "Frontiers",          "Journey"),
    ( "Ride the Lightning", "Metallica"),
    ( "She's So Unusual",  "Cyndi Lauper"),   
    ( "Smoke & Oakum",      "The Longest Johns"),  
    ( "Rumours",            "Fleetwood Mac"),            
    ( "Thriller",           "Michael Jackson"),         
    ( "Paranoid",           "Black Sabbath"),           
    ( "Unpeeled",           "Cage the Elephant");       

INSERT INTO Songs (songName, genreID, songDuration, albumID) VALUES 
    ('Separate Ways (Worlds Apart)',    1, '00:05:27', 1),
    ('Bones in the Ocean',              4, '00:03:42', 2),
    ('Master of Puppets',               3, '00:08:35', 3),
    ('True Colors',                     2, '00:03:47', 4),
    ('Faithfully',                      1, '00:04:27', 1),
    ('Send Her My Love',                1, '00:03:55', 1),
    ('Wellerman',                       4, '00:02:47', 2),
    ('Santiana',                        4, '00:02:51', 2),
    ('Battery',                         3, '00:05:12', 3),
    ('Welcome Home (Sanitarium)',       3, '00:06:27', 3),
    ('Change of Heart',                 2, '00:04:22', 4),
    ('What''s Going On',                2, '00:04:39', 4),
    ('Don''t Stop Believin''',          1, '00:04:11', 5),
    ('Any Way You Want It',             1, '00:03:22', 5),
    ('Wheel in the Sky',                1, '00:04:12', 5),
    ('Fade to Black',                   3, '00:06:57', 6),
    ('For Whom the Bell Tolls',         3, '00:05:09', 6),
    ('Creeping Death',                  3, '00:06:36', 6),
    ('Girls Just Want to Have Fun',     2, '00:03:58', 7),
    ('Time After Time',                 2, '00:04:01', 7),
    ('Hard Times Come Again No More',   4, '00:03:40', 8),
    ('The Workers Song',                4, '00:02:58', 8),
    ('Go Your Own Way',                 1, '00:03:38', 9),
    ('Dreams',                          1, '00:04:17', 9),
    ('The Chain',                       1, '00:04:28', 9),
    ('Billie Jean',                     2, '00:04:54', 10),
    ('Beat It',                         2, '00:04:18', 10),
    ('Thriller',                        2, '00:05:57', 10),
    ('Paranoid',                        3, '00:02:48', 11),
    ('Iron Man',                        3, '00:05:55', 11),
    ('War Pigs',                        3, '00:07:55', 11),
    ('Trouble',                         1, '00:03:45', 12),
    ('Ain''t No Rest for the Wicked',   1, '00:03:17', 12);


INSERT INTO Playlists (playlistName, genreID, numberSongs) VALUES 
    ('Ultimate Rock Mix',       1, 9),
    ('Late Night Pop Beats',    2, 6),
    ('Heavy Metal Thunder',     3, 8),
    ('Folk & Sea Harmonies',    4, 5);

INSERT INTO PlaylistSongs (playlistID, songID) VALUES 
    -- Ultimate Rock Mix (Playlist 1) -> 9 Songs
    (1, 1),  -- Separate Ways (Worlds Apart)
    (1, 5),  -- Faithfully
    (1, 6),  -- Send Her My Love
    (1, 13), -- Don't Stop Believin'
    (1, 14), -- Any Way You Want It
    (1, 15), -- Wheel in the Sky
    (1, 23), -- Go Your Own Way
    (1, 24), -- Dreams
    (1, 25), -- The Chain
    (2, 4),  -- True Colors
    (2, 11), -- Change of Heart
    (2, 12), -- What's Going On
    (2, 19), -- Girls Just Want to Have Fun
    (2, 20), -- Time After Time
    (2, 26), -- Billie Jean
    (3, 3),  -- Master of Puppets
    (3, 9),  -- Battery
    (3, 10), -- Welcome Home (Sanitarium)
    (3, 16), -- Fade to Black
    (3, 17), -- For Whom the Bell Tolls
    (3, 29), -- Paranoid
    (3, 30), -- Iron Man
    (3, 31), -- War Pigs
    (4, 2),  -- Bones in the Ocean
    (4, 7),  -- Wellerman
    (4, 8),  -- Santiana
    (4, 21), -- Hard Times Come Again No More
    (4, 22); -- The Workers Song
