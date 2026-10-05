# EmberLights Database Models

This document summarizes the conceptual, logical, and physical models used for the EmberLights database.

---

## Conceptual Model

<img width="702" height="572" alt="GroupConceptualModel" src="https://github.com/user-attachments/assets/0e1a956f-0554-4b30-bfe4-f96d8c1d6491" />


The conceptual model provides a high-level view of the main entities and relationships in the EmberLights database.

The main entities are Song, Genre, and Playlist.

The relationships represented are:
- A Song can be in multiple Playlists, and a Playlist can contain multiple Songs.
- A Song has one Genre.
- A Genre can define multiple Playlists.

---

## Logical Model

<img width="1607" height="666" alt="GroupLogicalModel (1)" src="https://github.com/user-attachments/assets/b50e8adc-9765-4be3-aad8-91854c76dc67" />


The logical model expands the conceptual model into the tables and relationships required by the database.

The tables are:
- Albums
- Songs
- Genres
- Playlists
- PlaylistSongs

`PlaylistSongs` is used as the junction table between Songs and Playlists.

Primary keys and foreign keys are included to define the relationships between the tables. Genre is associated with Songs rather than Albums so that songs within the same album can belong to different genres.

---

## Physical Model

<img width="1750" height="686" alt="physModel" src="https://github.com/user-attachments/assets/9a3cbbc9-9387-4885-b043-a37fa6652a9e" />


The physical model defines how the logical model is implemented in MariaDB. It includes the data types, primary keys, foreign keys, constraints, default values, and relationships used by the database.

The final physical model contains the following tables:
- Albums
- Songs
- Genres
- Playlists
- PlaylistSongs
