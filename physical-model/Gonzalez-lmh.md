# Gonzalez - Physical Model

---

## Group Logical Model

[View Group Logical Model](https://github.com/AMcGohan/cs4900-EmberLights-Database/tree/main/logical_model)

---
## Physical Model Components

### 1. Difference Between Conceptual, Logical, and Physical Models

The conceptual model identifies the main entities and their relationships.

The logical model defines the tables, attributes, primary keys, foreign keys, and relationships without depending on a specific database system.

The physical model defines how the database will be implemented, including specific data types, constraints, and default values. For our project, we are using MariaDB.

### 2. Common Data Types

- **INT:** Stores whole numbers.
- **VARCHAR(n):** Stores text with a maximum length.
- **TEXT:** Stores longer text.
- **DECIMAL:** Stores exact decimal numbers.
- **DATE:** Stores dates.
- **TIMESTAMP:** Stores date and time values.

### 3. Default Values and Null Values

A DEFAULT value is automatically used when no value is provided for a column. NULL means that a value is missing or unknown, while NOT NULL requires the column to have a value. In our model, required fields use NOT NULL. We also use CURRENT_TIMESTAMP for the creation time of playlists and a default value of 0 for the number of songs.

### 4. Check Constraints

CHECK constraints are used to make sure that values meet certain conditions.

Examples:
- Song duration must be greater than 0.
- The number of songs in a playlist cannot be negative.

These constraints prevent invalid data from being stored.

---

## Gonzalez-Physical Model

![Gonzalez - Physical Model](<img width="1526" height="722" alt="physical-model" src="https://github.com/user-attachments/assets/c876a302-014f-4d69-a089-e56c34be273a" />)

---

## Physical Model Description

This physical model contains five tables: Album, Songs, Genres, Playlists, and PlaylistSongs.

### Tables

- **Album:** Stores the album name and artist name. Each album can contain multiple songs.

- **Genres:** Stores the available music genres. It is referenced by Songs and Playlists.

- **Songs:** Stores song information, including its name, duration, album, and genre. Each song belongs to one album and one genre.

- **Playlists:** Stores playlist information, including its name, genre, creation time, and number of songs.

- **PlaylistSongs:** Connects songs and playlists using a composite primary key (songID, playlistID). This allows a song to appear in multiple playlists and a playlist to contain multiple songs.

### Relationships and Constraints

The model includes five foreign key relationships connecting the tables. Primary keys uniquely identify each record, while foreign keys maintain the relationships between tables. This model includes NOT NULL for required fields, AUTO_INCREMENT for IDs, DEFAULT values for some columns, and CHECK constraints to prevent invalid values. The genre is assigned to individual songs rather than albums because an album may contain songs from different genres.
