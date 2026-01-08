# 🌌 Universe Database Project

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/Language-SQL-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)
![FreeCodeCamp](https://img.shields.io/badge/FreeCodeCamp-Certified-black?style=for-the-badge&logo=freecodecamp)

## 📖 Overview

**Universe Database** is a comprehensive relational database project built using **PostgreSQL**. It models a hierarchical astronomical system containing galaxies, stars, planets, and moons.

This project was developed to fulfill the requirements of the **FreeCodeCamp Relational Database Certification**. It demonstrates a strong grasp of SQL fundamentals, including complex table relationships, strict data integrity constraints, and precise data typing.

---

## 🗂️ Database Schema

The database consists of five main tables linked through **Foreign Keys** to ensure referential integrity. The hierarchy flows as follows:

`Galaxy` -> `Star` -> `Planet` -> `Moon`

### 1. `galaxy` (Parent Table)
Represents the major galaxies in the observable universe.
- **Key Columns:** `galaxy_id` (PK), `name` (Unique), `galaxy_type`, `distance_from_earth`.
- **Features:** Boolean flags for life and black holes.

### 2. `star`
Represents stars belonging to specific galaxies.
- **Relationship:** Many-to-One with `galaxy`.
- **Key Columns:** `star_id` (PK), `galaxy_id` (FK), `age_in_years`, `spectral_type`.

### 3. `planet`
Represents planets orbiting the stars.
- **Relationship:** One-to-One / Many-to-One (Enforced via Unique Constraints where applicable).
- **Key Columns:** `planet_id` (PK), `star_id` (FK), `has_life`, `has_gravity`.

### 4. `moon`
Represents natural satellites orbiting the planets.
- **Relationship:** Many-to-One with `planet`.
- **Key Columns:** `moon_id` (PK), `planet_id` (FK), `diameter`, `composition`.

---

## 🛠️ Technical Highlights

The project implements strict SQL standards:

* **Data Integrity:** Extensive use of `NOT NULL` and `UNIQUE` constraints to prevent invalid data entry.
* **Relational Logic:** Correct implementation of **Primary Keys (PK)** and **Foreign Keys (FK)** to link celestial bodies hierarchically.
* **Data Types:** Utilization of various PostgreSQL types:
    * `INT` / `BIGINT` for ages and IDs.
    * `NUMERIC(4,1)` for precise astronomical distances (Light Years / AU).
    * `TEXT` / `VARCHAR` for names and descriptions.
    * `BOOLEAN` for flags like `has_life` or `has_gravity`.
* **Bash Scripting:** The repository includes a `pg_dump` of the database created via the command line.

---

## 🚀 How to Run

To run this project locally on your machine, follow these steps:

### Prerequisites
* **PostgreSQL** installed.
* **Git** installed.
* **Bash** terminal (Git Bash on Windows or standard Terminal on Linux/Mac).

### Installation Steps

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/VasiBestia/FreeCodeCamo_Universe_DataBase.git](https://github.com/VasiBestia/FreeCodeCamo_Universe_DataBase.git)
    cd FreeCodeCamo_Universe_DataBase
    ```

2.  **Access PostgreSQL:**
    ```bash
    psql -U postgres
    ```

3.  **Create the Database:**
    ```sql
    CREATE DATABASE universe;
    \c universe
    ```

4.  **Restore the Schema and Data:**
    You can restore the entire database structure and data from the `.sql` dump file:
    ```sql
    \i universe.sql
    ```

---

---

## 🧪 Sample Queries

Here are a few SQL queries you can run to test the data relationships:

### 🌍 Find all planets that support life
```sql
SELECT name, distance_from_earth
FROM planet
WHERE has_life = true;
```
### 🌙 List all moons and their parent planets
```sql
Copy code
SELECT moon.name AS moon_name,
       planet.name AS orbiting_planet
FROM moon
JOIN planet ON moon.planet_id = planet.planet_id;
```
---
👨‍💻 [Author]
VasiBestia

Project created for the FreeCodeCamp Relational Database Certification.
