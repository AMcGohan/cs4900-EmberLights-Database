# EmberLights - Physical Model
---
## Group Logical Model

The physical model is based on the logical model developed by the EmberLights group.

[View the Group Logical Model](https://github.com/AMcGohan/cs4900-EmberLights-Database/tree/main/logical_model)


---
## Physical Model Components

### 1. Difference Between Conceptual, Logical, and Physical Models

The conceptual model provides a high-level overview of the database, identifying the main entities and their relationships without including implementation details.

The logical model defines the structure of the database in more detail, including tables, attributes, primary keys, foreign keys, and relationships. It is independent of any specific database management system.

The physical model describes how the database will be implemented in a specific database management system. It includes tables, columns, data types, primary and foreign keys, default values, null constraints, and check constraints.

For this project it converts the group's logical model into a database structure that can be implemented using MariaDB-supported data types and constraints.


---

### 2. Common Data Types

Data types define the kind of information that can be stored in each column of a database table. Choosing appropriate data types helps maintain data integrity and use storage efficiently.

Common data types include:

- **INT:** Stores whole numbers. It is commonly used for primary keys and foreign keys.
- **VARCHAR(n):** Stores variable-length text with a maximum length of n characters. It is useful for names, titles, and email addresses.
- **CHAR(n):** Stores fixed-length character strings.
- **TEXT:** Stores longer text, such as descriptions.
- **DECIMAL(p,s):** Stores exact numeric values with a specified precision and scale.
- **DATE:** Stores a date in YYYY-MM-DD format.
- **DATETIME:** Stores both date and time values.
- **TIMESTAMP:** Stores date and time values and can be used to track when records are created or updated.
- **BOOLEAN:** Represents true or false values. In MariaDB, BOOLEAN is an alias for TINYINT(1).

For this physical model, INT UNSIGNED will be used for identifiers, VARCHAR for song and playlist names, TEXT for longer descriptions, and appropriate date and time types for temporal information.


---

### 3. Default Values and Null Values

Default values and null constraints define how missing or unspecified data is handled in a database.

**Default Values:**

A default value is automatically assigned to a column when no value is provided during the insertion of a new record. Default values help maintain consistency and reduce the need to manually enter repetitive information.

**Null Values:**

NULL represents a missing or unknown value in a database. It is different from zero or an empty string.

- **NULL:** Allows a column to contain missing or unknown information.
- **NOT NULL:** Requires a column to contain a value.
- **DEFAULT:** Provides a predefined value when no value is specified.

In this physical model, primary keys and required attributes will use NOT NULL to ensure data integrity. Optional attributes, such as descriptions, may allow NULL values.

Default values will be used where appropriate, such as automatically recording the creation date of a playlist.
