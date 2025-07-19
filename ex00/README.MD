# 🚀 Exercise 00 — Create PostgreSQL DB in Docker

Welcome to Exercise 00 of the Piscine Data Science!  
You’ll create a PostgreSQL database that runs inside Docker, manage configuration securely using `.env`, and test it using the `psql` client.

This README explains **how everything works**, how to **test it**, and how to use **basic PostgreSQL commands**.

---

## 🧪 Setup Requirements

Before using this project, run:

```bash
./setup.sh
```

## 🧠 What Are You Building?

You're using Docker to run a PostgreSQL database called `piscineds`.  
This database will:

- Run in a container (like a lightweight VM)
- Use your student login as the username (e.g., `abaiao-r`)
- Require a password (`mysecretpassword`)
- Be accessible from your host using this command:

```bash
psql -U abaiao-r -d piscineds -h localhost -W
```

## 🛠️ How to test it

1. **Start the Docker container**:
   ```bash
   make up
   ```
   or in terminal:
   ```bash
   docker-compose --env-file .env up -d
   ```
2. **Open the PostgreSQL client**:
   ```bash
   make psql
   ```
   or in terminal:
   ```bash
   docker exec -it postgres psql -U abaiao-r -d piscineds
   ```
   to test outside the container:
   ```bash
   psql -U abaiao-r -d piscineds -h localhost -W
   ```
3. **If Password is requested**:
   Enter `mysecretpassword`.

   you should see a prompt like this:
   ```
    piscineds=#
```
---

🧪 **Useful PostgreSQL Commands**

Once inside the psql interface, you can use the following commands:

```sql
-- List all databases
\l

-- List all tables in current DB
\dt

-- Create a table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INT
);

-- Insert data
INSERT INTO students (name, age) VALUES ('Alice', 18), ('Bob', 20);

-- Query data
SELECT * FROM students;

-- Exit psql
\q
```

---

🧼 **Stopping and Cleaning**

To stop and clean up your Docker containers, use the following commands:

```bash
make down                   # stop containers
docker ps                   # list running containers
docker-compose down -v      # remove containers + volumes
```

---

🧠 **Concepts Explained**

| Concept      | What it means                                 |
|--------------|-----------------------------------------------|
| PostgreSQL   | A powerful open-source SQL database           |
| Docker       | Lightweight containers to run isolated environments |
| .env         | File to store secrets like passwords (never commit this!) |
| psql         | CLI tool to talk to PostgreSQL                |
| 5432         | Default port PostgreSQL listens to            |

---

✅ **Submission Checklist**

| Requirement                         | Status |
|--------------------------------------|--------|
| Docker Compose sets up Postgres      | ✅     |
| Username is your student login       | ✅     |
| Database is named piscineds          | ✅     |
| Password is mysecretpassword         | ✅     |
| Connects via psql -W properly        | ✅     |
| No root user, no insecure flags      | ✅     |
| No latest image tag used             | ✅     |
| .env used and ignored in git        | ✅     |


