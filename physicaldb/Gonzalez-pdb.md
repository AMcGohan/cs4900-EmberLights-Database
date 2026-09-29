
# Gonzalez - Physical Database

## Physical Database Concepts

### CREATE TABLE Statement

A CREATE TABLE statement defines a table's name, columns, data types, primary keys, foreign keys, and constraints.

### Database Constraints

Constraints are rules that control the data stored in a database. They prevent invalid entries and maintain data integrity. Examples include PRIMARY KEY, FOREIGN KEY, NOT NULL, and CHECK.

### Ways to Insert Data

Data can be inserted using the SQL INSERT INTO statement, either one row at a time or multiple rows. Database management tools can also be used to insert or import data.

### Database Roles

Database roles define sets of permissions assigned to users. They control which operations users can perform, such as SELECT, INSERT, UPDATE, and DELETE.

### Types of Database Users

- Database Administrators (DBAs): Manage and maintain the database.
- Database Designers: Design tables and relationships.
- Application Programmers: Develop applications that use the database.
- Systems Analysts: Analyze system and database requirements.
- End Users: Access information through applications or queries.

## Group Physical Model

[View Group Physical Model](https://github.com/AMcGohan/cs4900-EmberLights-Database/tree/main/physical_model)

## Database Initialization Script

[View SQL Initialization Script](db_init.sql)

The script creates the music_app database and the five tables from our group physical model: Albums, Genres, Songs, Playlists, and PlaylistSongs.

It defines primary keys, foreign keys, data types, and constraints. The tables are created in order to ensure that referenced tables exist before their relationships are established.
