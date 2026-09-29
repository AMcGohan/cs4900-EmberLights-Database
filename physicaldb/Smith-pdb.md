# Concepts

## What information should be included in a create table statement
* Name - What is the name of the table/ what is it called
```
CREATE TABLE Name
```
* Columns
  * Column Name - What is the name of the column
    ```
    CREATE TABLE Name (Column_Name)
    ```
  * Column Data Type - What data does the column hold
    ```
    CREATE TABLE Name (Column_Name Column_Data_Type)
    ```
  * Primary Key - Is the column a primary key can be set to AUTO_INCREMENT if you want the system to auto count your primary key
    ```
    CREATE TABLE Name (Column_Name Column_Data_Type PRIMARY KEY)
    ```
  * Nulls - Specify whether the column can be null by adding NOT NULL or leaving it blank
    ```
    CREATE TABLE Name (Column_Name Column_Data_Type PRIMARY KEY NOT NULL)
    ```
  * Uniques - Force a column to hold unique values by adding UNIQUE
    ```
    CREATE TABLE Name (Column_Name Column_Data_Type UNIQUE)
    ```

## What are database constraints and what are the benefits of them
A database constraint is a set of rules that data within the table will have to follow.  
Examples include
* Primary Key - Its use is to make sure each set of data within the column is unique thus making it a unique identifier for each row
* NOT NULL - This specifies that data with this constraint can't store null. This is used for when data is required for a table
* FOREIGN KEY - This is used to identify the rows in another table within the current one.  This is used when information from another table is important to the current one.
* CHECK - Forces data to meet a specific condition that is set for data to be valid.  This is useful when you want to limit the scope of enterable data.
* DEFAULT - Specifies a starting value that if the value isn't specified that is the one inputed. Useful for catchall cases
* UNIQUE - Another way to make a column hold only unique values.

## Ways to insert data
You insert data into a table using the basic formula
```
INSERT INTO Table_Name (Col1, ...) VALUES (val1, ...)
```

You can also update columns that have already been inserted using the UPDATE keyword
```
UPDATE Table_Name
SET Column_Name
WHERE Condition
```

You can delete from a table using
```
DELETE FROM Table_Name 
WHERE Condition
```

## What are database roles and what are they used for
A database role is a set of permissions.  These roles once they have been granted the permissions can then be given to users of the database.  This makes it so that you don't have to go to each user and individually give them the permissions needed to do their work. You will only have to give them the role that has the permissions needed for their work. 

## Different type of users
* Native User - The users who don't need to know about the database. Also called end users
* Application Programmer - They are the ones who devolp the user interfaces and application program
* Sophisticated User - They interact with the database system without writing programs
* Specialized User - They write specialized database programs
* Online User - User who can directly interact with the database system online

# Models

## Physical
Our physical model can be found [here](../physical_model/README.md)

# Scripts

```
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
```
This script will create a table with a id that auto increments.  It only has a name and an artist name both using varchar. Neither can be null as every song has an artist and an album  

Next is the genre table
```
CREATE TABLE Genre (
    genreID INT PRIMARY KEY AUTO_INCREMENT,
    genreName VARCHAR(50) NOT NULL,
);
```
This table only has an auto incrementing id and a name that can't be null
  
Next is the playlist table
```
CREATE TABLE Playlist (
    playlistID INT PRIMARY KEY AUTO_INCREMENT,
    playlistName VARCHAR(50) NOT NULL,
    creationTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    numberSongs TINYINT NOT NULL  DEFAULT 10 CHECK (numberSongs >= 0),
    genreID INT,
    FOREIGN KEY (genreID) REFERENCES Genre(genreID)
);
```
This table has an auto incrementing id.  A space for the name of the playlist that can't be null.  The date that the playlist is created is stored as a datetime and can't be null.  It has a default value of the current time that the entry was inputted.  It has a value for the  number of songs in the playlist using a tinyint to limit the number of songs allowed in the playlist.  It can't be null because every playlist must have songs.  There is a check making sure that there are songs in the playlist. Also it has a default value if a value isn't inputted. Finally there is a foreign key referencing the id of the playlist genre from the genre table.

Next is the song table
```
CREATE TABLE Song (
    songID INT PRIMARY KEY AUTO_INCREMENT,
    songName VARCHAR(100) NOT NULL,
    songDuration TIME NOT NULL CHECK(songDuration > '00:00:00'),
    genreID INT,
    albumID INT,
    FOREIGN KEY (genreID) REFERENCES Genre(genreID),
    FOREIGN KEY (albumID) REFERENCES Album(albumID)
);
```
This table starts with an id that the system will auto increment as ne entreys are added.  Next it has a space for a name that can't be null as every song has a title.  The songs duration is kept in a time.  It can't be null as the songs length will be displayed in app.  It has a a check to make sure that the song isn't 0 or negative time.  Finally the table has 2 foreign keys that take from the album table and the genre table.  

Finally is the playlistSongs table
```
CREATE TABLE PlaylistSongs (
    songID INT,
    playlistID INT,
    PRIMARY KEY(songID, playlistID),
    FOREIGN KEY (songID) REFERENCES Song(songID),
    FOREIGN KEY (playlistID) REFERENCES Playlist(playlistID)
);
```
This creates a table that only has a primary key.  This key is made up of two foreign keys.  These foreign keys are the ids of the songs and playlist tables