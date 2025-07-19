# 🚀 Exercise 01 — Show Me Your DB (Visualized with pgAdmin + Docker)

Welcome to Exercise 01 of the Piscine Data Science. 
This exercise sets up **pgAdmin** to visualize and interact with a PostgreSQL database running inside Docker containers.

This README explains how to run everything, how pgAdmin connects automatically, and includes test SQL to verify the database.

---

## 🧪 Setup Requirements

1. Before starting, run:

   ```bash
   ./setup.sh     # Checks/installs docker, docker compose, psql
   ```

2. 🔐 Setting Up Your .env File

   The `.env` file is where all sensitive information like usernames and passwords are stored safely. This file should never be committed to git because it contains secrets.

1. In the root of your project (where the `docker-compose.yml` file is), create a new file named `.env`:

   ```bash
   touch .env
   ```

2. Open .env in your favorite text editor, and add the following variables (replace the example values with your own secure choices):

   ``` plaintext
   POSTGRES_USER=your_postgres_username
   POSTGRES_PASSWORD=your_secure_password
   POSTGRES_DB=your_database_name

   PGADMIN_EMAIL=your_pgadmin_email@example.com
   PGADMIN_PASSWORD=your_pgadmin_password
   ```

---

## 🛠️ Services Overview

Two services run using Docker:

- 🐘 `postgres`: PostgreSQL database
- 🧠 `pgadmin`: Browser-based GUI for PostgreSQL

Start both with:

   ```bash
   make up
   ```

or in terminal:

   ```bash
   docker-compose --env-file .env up -d
   ```

pgAdmin will auto-connect to the database using the `servers.json` config.

---

## 🌐 Accessing pgAdmin in the Browser

2. Open in browser:
```
http://localhost:8080
```

or:

   ```bash
   open http://localhost:8080 || xdg-open http://localhost:8080 || echo "Open manually → http://localhost:8080"
   ```

3. Log in using the email and password set in your .env file.
These credentials are configured via environment variables (PGADMIN_EMAIL and PGADMIN_PASSWORD).
Make sure to check your .env file for the exact values you set.

4. Visual confirmation:
```
📂 Servers
 └── PiscineDS_DB
      └── piscineds
          └── Tables
```
Database is now ready for browsing, inserting, and querying data.

---

## 💾 pgadmin/servers.json (Auto-Connection Config)

This file is used by pgAdmin to automatically connect to the PostgreSQL container when pgAdmin starts. It saves time and ensures the connection details (host, port, username, database) are pre-configured.

What happens if servers.json is missing?

# 🔧 Manually Adding a Server Connection in pgAdmin (if no servers.json)

If the automatic connection using `servers.json` is not available, follow these steps to add the PostgreSQL server manually in pgAdmin:

1. Open pgAdmin in your browser at the configured address.

2. Log in with your pgAdmin user credentials.

3. In the left sidebar, right-click on **Servers** and select **Create > Server**.

4. In the **Create - Server** dialog:

   - **Under the General tab**, enter any preferred name for this server connection.

   - **Under the Connection tab**, fill in the following fields:
     - **Host name/address**: Enter the Docker service name for PostgreSQL.
     - **Port**: Enter the PostgreSQL port number.
     - **Maintenance database**: Enter the database name.
     - **Username**: Enter your PostgreSQL user.
     - **Password**: Enter the corresponding PostgreSQL password. Optionally, enable “Save password.”

5. Click **Save** to add the server.


Summary

Using servers.json automates this process for convenience and consistency. Without it, manual setup is needed every time pgAdmin is started fresh.


---

## 🧪 Useful PostgreSQL Commands (via pgAdmin Query Tool)

```sql
-- Create a table
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INT
);

-- Insert values
INSERT INTO students (name, age) VALUES ('Alice', 18), ('Bob', 20);

-- Query data
SELECT * FROM students;
```

---

## 📦 Makefile Commands

```bash
make up        # Start all containers
make down      # Stop containers
make fclean    # Remove containers, images, volumes
```

### 🛠️ Manual Alternatives (No Makefile)

| Action            | Command                                                  |
|-------------------|-----------------------------------------------------------|
| Start containers  | `docker compose --env-file .env up -d`                  |
| Stop containers   | `docker compose --env-file .env down`                   |
| Clean everything  | `docker compose --env-file .env down --volumes --rmi all` |

These commands are equivalent to the Makefile targets, and require no `make`.

---

## 🧠 Concepts Summary

| Concept      | Description                                              |
|--------------|----------------------------------------------------------|
| PostgreSQL   | Open-source relational database                          |
| Docker       | Tool to run services in isolated containers              |
| pgAdmin      | GUI to interact with PostgreSQL                         |
| .env         | Secure file to store sensitive environment variables     |
| Auto-connect | pgAdmin connects via preloaded config in servers.json   |

---

## ✅ Submission Checklist

| Requirement                         | Status |
|------------------------------------|--------|
| Docker Compose sets up PostgreSQL  | ✅     |
| pgAdmin is integrated and working  | ✅     |
| DB: `piscineds` is visible         | ✅     |
| Auto-login to pgAdmin works        | ✅     |
| No root, no latest tag used        | ✅     |
| .env used and ignored in git       | ✅     |

---

Database is now visualized and usable in the browser using pgAdmin. This setup is suitable for browsing, querying, and managing records efficiently.
