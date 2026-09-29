# McGohan Physical Database

### Information to be included in a CREATE table statement
The CREATE table statement includes the name of the entity, the entity's attributes, and their datatypes.

### Database Constraints And Their Benefits
Constraints are rules that the data within a table must follow. Constraints stop invalid data from entering the database, ensuring integrity of data.

### Ways to Insert Data
Inserting data can be done via the `INSERT` statements.

For example, if I wanted to add The Beatles' "Sgt. Pepper's Lonely Hearts Club Band" to the `Albums` table, I would run the following statement:

```sql
INSERT INTO Albums (albumName, artistName)
VALUES ('Sgt. Pepper''s Lonely Hearts Club Band', 'The Beatles');
```

### Database Roles

Database roles are groups of users that interact with the database with specific permissions.

### Database users

Some examples of database users:

* `db_owner` - Has access to the entire database, so they can `SELECT` and `INSERT` any row

* `db_datareader` - Can run `SELECT` on all tables.

* `db_datawriter` - Can run `INSERT`, `UPDATE`, OR `DELETE` on all tables.

* `db_securityadmin` - Can manage database roles for other users that have access to the database.

## Physical Model

[Link to Group Physical Model](../physical_model/README.md)

[Link to Database SQL Script](music_app.sql)
    * Script creates a database named `music_app` and creates 5 tables according to the group physical model.
    * All Primary keys use `AUTO_INCREMENT` to ensure unique keys among objects
    * All Foreign Keys are referenced to their original tables