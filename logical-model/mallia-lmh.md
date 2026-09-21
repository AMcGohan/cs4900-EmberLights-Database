# Logical Model - Mallia
## Definitions
- Purpose of a Logical Model: A logical model defines the logical structure of the database. This defines datatypes, relationships, keys, etc. A proper logical model should be able to be implemented in most database management systems.
- Primary Key: This is the unique identifier that serves to differentiate a record from all other records in the table. 
- Foreign Key: A foreign key is when one table references the primary key of another table to establish a relationship between items. 
- Relationships between Entities: A relationship between entities establishes how data is interconneted. These can be one-to-one, or many-to-one. At the logical level, many-to-many relationships are not permitted. 
- Normalization: Normalization levels describe sets of rules to establish data safety and reduce redundancy. 

## Group Conceptual Model
[Group Conceptual Model](https://github.com/AMcGohan/cs4900-EmberLights-Database/tree/main/conceptual_model)

## Logical Model Diagram
![Logical Model Diagram](logical-model/mallia-lmh.png)

### Descripiton
This logical model consists of four tables. There are the original three from the conceptual model: Songs, Genres, and Playlists; as well as the intermediary table for the many-to-many relationship between Songs and Playlists: PlaylistSongs. 

Songs and Playlists use a surrogate key as their primary key, and Genres uses the business ley of the genreName. PlaylistSongs uses a composite key of playlistID and songID as its primary Key.

The genreName is references as a foreign key from both the Songs table and the Playlists table to establish the many to one relationship between them and songs. songID and playlistID are foreign keys in the PlaylistSongs table to establish the songs that are in a playlist. 