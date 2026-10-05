# Database Container

## How to initialize the database
1. Clone this repository to your local machine/server
2. Navigate to this directory
3. In the terminal, run `docker compose up`
4. Once the database is ready to accept incoming connections, open `DBeaver` and connect to the server using the given default values:
  - Database: `MariaDB`
  - Default port: `3320`
  - Default username: `user`
  - Default password: `password`

## Post Initialization

Start the database
- run `docker compose start` in this directory

Stop the database
- run `docker compose stop` in this directory

Purge container volume
- run `docker compose down` in this directory
