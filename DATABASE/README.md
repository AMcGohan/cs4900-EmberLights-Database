# Database Elements
This repo contains the database work for the Emberlights group of Wright State University's CS4900! Our project is a tool designed to help people who love music find new music that they love. To that end, we are making a random playlist generator that will randomly populate a playlist with songs based on a given genre and allow the user to swap out songs that they don't like, thereby eventually curating a selection of songs that they love.

## Contents:
- [Database Initialization Scripts](#database-initialization-scripts)
- [Models](#models)
- [Business Queries](#business-queries)

## Database Initialization Scripts
The [db_init_scripts](./db_init_scripts/) folder contians the code to spool up a Docker container that runs our database in MariaDB. It contains a `docker-compose.yml` file that defines the construction of the container, a `db_init.sql` file that creates the tables in the database and populates it with sample data, and a `README.md` file that provides instructions on how to utilize the docker container.

## Models
The [Models](./Models/) folder contains the design documentation of our database. It has the [conceuptual model](./Models/conceptual_model/), which is a simple overview of the entities and relationships in our database, the [logical model](./Models/logical_model/) which pictures the logical organization of that data using primary keys and foreign keys, and the [physical model](./Models/physical_model/) which shows how the database actually functions complete with datatypes and constraints. 

## Business Queries
The [sql_queries](./sql_queries/) folder contains the business application of our database. It shows what business questions we might ask of our database, and a few queries to answer those questions. 