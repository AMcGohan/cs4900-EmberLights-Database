
# Gonzalez - Physical Database

## 1. Physical Database Concepts

### CREATE TABLE Statement

A CREATE TABLE statement defines the structure of a database table. It includes the table name, columns, data types, primary keys, foreign keys, and constraints such as NOT NULL. It can also define default values and automatically generated IDs.

### Database Constraints

Constraints are rules used to maintain data integrity and prevent invalid information from being stored.

Common constraints include PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, and CHECK. They help ensure that records are valid and relationships between tables remain consistent.

### Ways to Insert Data

Data can be added using the SQL INSERT INTO statement. This allows inserting individual records or multiple records at once.

Data can also be inserted through database management tools or imported from external files such as CSV files.

### Database Roles

Database roles define sets of permissions that can be assigned to users. They determine which database operations a user is allowed to perform, such as reading, inserting, updating, or deleting information.

Roles make permission management easier and help improve database security.

### Types of Database Users

- Database Administrators (DBAs): Manage database security, maintenance, and backups.
- Database Designers: Define tables, relationships, and database structures.
- Application Programmers: Develop software that interacts with the database.
- Systems Analysts: Analyze requirements and determine how the database should support the system.
- Naive Users: Interact with the database through predefined application interfaces.
- Casual Users: Access the database occasionally to retrieve information.
- Sophisticated Users: Use advanced database tools and queries.
- Specialized Users: Develop applications with specific database requirements.

---

## 2. Group Physical Model

The database is based on our group's physical model for the EmberLights project.

[View Group Physical Model](https://github.com/AMcGohan/cs4900-EmberLights-Database/tree/main/physical_model)

![Group Physical Model](group-physical-model.png)

---

## 3. Database Initialization Scripts

The following SQL scripts initialize the EmberLights database using MariaDB.

The scripts are organized by execution order to ensure that referenced tables exist before their foreign keys are created.

| Order | Script | Description |
|---|---|---|
| 00 | [00_create_database.sql](00_create_database.sql) | Creates the EmberLights database. |
| 01 | [01_create_albums.sql](01_create_albums.sql) | Creates the Albums table. |
| 02 | [02_create_genres.sql](02_create_genres.sql) | Creates the Genres table. |
| 03 | [03_create_songs.sql](03_create_songs.sql) | Creates the Songs table. |
| 04 | [04_create_playlists.sql](04_create_playlists.sql) | Creates the Playlists table. |
| 05 | [05_create_playlist_songs.sql](05_create_playlist_songs.sql) | Creates the PlaylistSongs table. |

---

## 4. Script Descriptions

### Database Initialization

The first script creates the EmberLights database and selects it for use.

### Albums

Stores album names and artist information. Each album is identified by an automatically generated primary key.

### Genres

Stores the available music genres. Each genre has a unique identifier used by other tables.

### Songs

Stores song information, including its name, duration, genre, and album. Foreign keys connect songs to Albums and Genres. A CHECK constraint ensures that song duration is greater than zero.

### Playlists

Stores playlist information and its associated genre. The creation time is automatically assigned, and numberSongs has a default value of 10.

### PlaylistSongs

Connects songs and playlists through a many-to-many relationship. A composite primary key prevents duplicate song and playlist combinations.

### Foreign Key Behavior

The scripts use RESTRICT to prevent deleting a genre that is still referenced.

CASCADE is used for dependent records when deleting albums, songs, or playlists.

---

## 5. Execution

Run the scripts in numerical order, starting with 00_create_database.sql.

The tables are created using InnoDB to support foreign key relationships.
