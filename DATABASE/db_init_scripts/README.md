# Database Container

## How to initialize the database
1. Clone this repository to your local machine/server
2. Navigate to this directory
3. In the terminal, run `docker compose up`

## How to connect to database via DBeaver
1. Once the database is ready to accept incoming connections, open `DBeaver` and right click in the left space and click `Create New Connection`
<img width="494" height="636" alt="image" src="https://github.com/user-attachments/assets/eafe7f4b-0b56-4e6e-8c66-27e59d4bf30f" />

2. Select `MariaDB`

<img width="558" height="580" alt="image" src="https://github.com/user-attachments/assets/d33a0f7d-aa5f-4d0f-8869-6933976a5e2a" />

3. Set the following values in the `Connect to a database` window:
  - Server host: `localhost` (If running database outside of your local machine, input the machines hostname here)
  - Port: `3320`
  - Username: `user`
  - Password: `password`

## Post Initialization

Start the database
- run `docker compose start` in this directory

Stop the database
- run `docker compose stop` in this directory

Purge container volume
- run `docker compose down` in this directory
