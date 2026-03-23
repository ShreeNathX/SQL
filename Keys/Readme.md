# DBMS Keys - Complete Reference

A complete reference guide for all keys in Database Management Systems.
There are many types of keys discussed in theory, but in practice, **10 keys** are commonly used.
This repository covers all 10 standard keys with definitions, use cases, and syntax - plus Secondary Key as a bonus reference.

---

## Table of Contents

- [Overview](#overview)
- [1. Primary Key](#1-primary-key)
- [2. Candidate Key](#2-candidate-key)
- [3. Super Key](#3-super-key)
- [4. Alternate Key](#4-alternate-key)
- [5. Foreign Key](#5-foreign-key)
- [6. Composite Key](#6-composite-key)
- [7. Surrogate Key](#7-surrogate-key)
- [8. Natural Key](#8-natural-key)
- [9. Unique Key](#9-unique-key)
- [10. Partial Key](#10-partial-key)
- [Bonus: Secondary Key](#bonus-secondary-key)
- [Quick Comparison Table](#quick-comparison-table)

---

## Overview

In DBMS, keys are attributes (or sets of attributes) used to identify, relate, and organize records in a table.
While database theory defines many types of keys, the following 10 are standard and widely used across relational databases like MySQL, PostgreSQL, and SQL Server.

| # | Key | Implementable in SQL |
|---|-----|---------------------|
| 1 | Primary Key | Yes |
| 2 | Candidate Key | Yes (conceptually) |
| 3 | Super Key | Yes (conceptually) |
| 4 | Alternate Key | Yes - via `UNIQUE NOT NULL` |
| 5 | Foreign Key | Yes - via `FOREIGN KEY` |
| 6 | Composite Key | Yes - via multi-column `PRIMARY KEY` |
| 7 | Surrogate Key | Yes - via `AUTO_INCREMENT` |
| 8 | Natural Key | Yes - use real-world data as PK |
| 9 | Unique Key | Yes - via `UNIQUE` |
| 10 | Partial Key | Yes - via composite PK on weak entity |

---

## 1. Primary Key

### Definition
A column or set of columns that **uniquely identifies every row** in a table.
Each table can have only one primary key. It automatically enforces `NOT NULL` and `UNIQUE`.

### Use Case
Used as the main identifier for each record. Referenced by foreign keys in other tables.
Example: `student_id` in a Students table.

### Syntax

```sql
CREATE TABLE students (
    student_id  INT,
    name        VARCHAR(100),
    email       VARCHAR(100),
    dept        VARCHAR(50),
    age         INT,

    PRIMARY KEY (student_id)
);
```

### Rules
- Must be unique for every row
- Cannot be NULL
- Only one primary key per table
- Can be referenced by foreign keys in other tables

---

## 2. Candidate Key

### Definition
A **minimal set of attributes** that can uniquely identify a row.
A table can have multiple candidate keys - one is chosen as the primary key, and the rest become alternate keys.

### Use Case
Used during database design to identify all possible primary key options.
Example: In an Employees table, both `emp_id` and `email` can uniquely identify a row - both are candidate keys.

### Syntax

```sql
CREATE TABLE employees_ck (
    emp_id  VARCHAR(10),
    email   VARCHAR(100) NOT NULL,
    name    VARCHAR(100),
    dept    VARCHAR(50),
    salary  DECIMAL(10,2),

    PRIMARY KEY (emp_id),    -- Candidate Key 1 chosen as PK
    UNIQUE (email)           -- Candidate Key 2 (also qualifies as PK)
);
```

### Rules
- Must be unique
- Must be minimal - no redundant columns
- Cannot be NULL
- Any one of the candidate keys can be chosen as the primary key

---

## 3. Super Key

### Definition
Any set of one or more attributes that can **uniquely identify a row**.
Unlike candidate keys, super keys may contain extra (redundant) columns.
Every candidate key is a super key, but not every super key is a candidate key.

### Use Case
Used in theoretical database design to understand all possible combinations that can uniquely identify a row.
Example: `{product_id}`, `{barcode}`, `{product_id, name}`, `{product_id, barcode, category}` - all are super keys.

### Syntax

```sql
CREATE TABLE products (
    product_id  VARCHAR(10),
    barcode     VARCHAR(20) NOT NULL,
    name        VARCHAR(100),
    category    VARCHAR(50),
    price       DECIMAL(8,2),

    PRIMARY KEY (product_id),    -- Super Key (minimal = candidate key)
    UNIQUE (barcode)             -- Super Key (minimal = candidate key)

    -- {product_id, name}              -> also a super key (redundant column)
    -- {product_id, barcode}           -> also a super key
    -- {product_id, name, category}    -> also a super key
);
```

### Rules
- Must uniquely identify rows
- May have redundant columns
- A candidate key is always a super key
- Many super keys exist per table

---

## 4. Alternate Key

### Definition
All candidate keys **that were not chosen as the primary key** are called alternate keys.
They are still unique and not null - just not the official identifier of the table.

### Use Case
Used when a table has multiple unique identifiers and you want to enforce uniqueness on non-primary columns.
Example: In a BankAccounts table, `account_no` is chosen as PK. The `pan_number` is the alternate key.

### Syntax

```sql
CREATE TABLE bank_accounts (
    account_no  VARCHAR(10),
    pan_number  VARCHAR(10) NOT NULL,
    holder_name VARCHAR(100),
    branch      VARCHAR(50),
    balance     DECIMAL(12,2),

    PRIMARY KEY (account_no),    -- Chosen as PK
    UNIQUE (pan_number)          -- Alternate Key (could have been PK)
);
```

### Rules
- Unique across all rows
- Cannot be NULL
- Enforced using `UNIQUE NOT NULL`
- Could have been chosen as the primary key

---

## 5. Foreign Key

### Definition
A column that **references the primary key of another table**.
It creates a parent-child relationship between two tables and enforces referential integrity.
You cannot insert a value in the child table that does not exist in the parent table.

### Use Case
Used to link related tables together.
Example: `dept_id` in an Employees table references `dept_id` in the Departments table.

### Syntax

```sql
-- Parent table
CREATE TABLE departments (
    dept_id   VARCHAR(5),
    dept_name VARCHAR(50),
    location  VARCHAR(50),
    head      VARCHAR(100),
    budget    DECIMAL(12,2),

    PRIMARY KEY (dept_id)
);

-- Child table
CREATE TABLE employees_fk (
    emp_id  VARCHAR(10),
    name    VARCHAR(100),
    role    VARCHAR(50),
    dept_id VARCHAR(5),          -- Foreign Key column
    salary  DECIMAL(10,2),

    PRIMARY KEY (emp_id),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
```

### Rules
- Value must exist in the referenced (parent) table
- Can be NULL (unless explicitly restricted)
- Can repeat - multiple rows can have the same FK value
- `ON DELETE CASCADE` / `ON UPDATE CASCADE` control what happens when parent record is deleted or updated

---

## 6. Composite Key

### Definition
A primary key made up of **two or more columns** whose combined value uniquely identifies a row.
No single column alone is sufficient - only the combination is unique.

### Use Case
Common in junction tables that resolve many-to-many relationships.
Example: In an Attendance table, a student can attend multiple subjects and a subject can have multiple students so `(student_id, subject_id)` together form the composite key.

### Syntax

```sql
CREATE TABLE attendance (
    student_id  INT,
    subject_id  INT,
    date        DATE,
    status      VARCHAR(10),
    remarks     VARCHAR(50),

    PRIMARY KEY (student_id, subject_id)    -- Composite Key
);
```

### Rules
- Each individual column can have repeated values
- The combination of all key columns must be unique
- No extra columns are required beyond the combination
- Common in bridge/junction tables in many-to-many relationships

---

## 7. Surrogate Key

### Definition
An **artificial key generated by the system** with no real-world meaning.
Typically implemented using `AUTO_INCREMENT` (MySQL) or `UUID`.
Used when no clean natural identifier exists or when natural keys are too complex.

### Use Case
Used when the data has no reliable natural unique identifier.
Example: An `order_id` generated automatically for each new order.

### Syntax

```sql
CREATE TABLE orders (
    order_id      INT AUTO_INCREMENT,    -- Surrogate Key (system generated)
    customer_name VARCHAR(100),
    product       VARCHAR(100),
    amount        DECIMAL(10,2),
    order_date    DATE,

    PRIMARY KEY (order_id)
);

-- No need to insert order_id — MySQL generates it automatically
INSERT INTO orders (customer_name, product, amount, order_date) VALUES
('Anil Kapoor', 'Laptop', 55000, '2024-01-10');
```

### Rules
- Has no business meaning
- Generated automatically by the database system
- Stable — never changes even if other data changes
- Always unique

---

## 8. Natural Key

### Definition
A key that comes from the **real-world data itself** - like an Aadhaar number, PAN card, passport number, or email address.
It has business meaning and exists independently of the database.

### Use Case
Used when the real-world data already has a reliable, unique identifier.
Example: Using `aadhaar_no` as the primary key in a Citizens table.

### Syntax

```sql
CREATE TABLE citizens (
    aadhaar_no  CHAR(14),         -- Natural Key (real-world identifier)
    full_name   VARCHAR(100) NOT NULL,
    dob         DATE,
    state       VARCHAR(50),
    gender      CHAR(1),

    PRIMARY KEY (aadhaar_no)
);
```

### Rules
- Has real-world meaning outside the database
- Not generated by the system
- Risk: if the real-world value changes, the database must be updated
- Opposite of a surrogate key

---

## 9. Unique Key

### Definition
Ensures all values in a column are **unique across all rows**.
Unlike a primary key, a unique key allows **one NULL value**.
A table can have multiple unique keys.

### Use Case
Used when a column must not have duplicates but is not the main identifier.
Example: `username` and `phone` in a Users table - both must be unique, but `user_id` is the primary key.

### Syntax

```sql
CREATE TABLE users (
    user_id   INT AUTO_INCREMENT,
    username  VARCHAR(50)  NOT NULL,
    phone     VARCHAR(15),              -- Allows one NULL
    city      VARCHAR(50),
    plan      VARCHAR(20),

    PRIMARY KEY (user_id),
    UNIQUE (username),                  -- Unique Key
    UNIQUE (phone)                      -- Unique Key (one NULL allowed)
);
```

### Rules
- No duplicate values allowed
- Allows exactly one NULL
- Multiple unique keys are allowed per table
- Automatically creates an index on the column

---

## 10. Partial Key

### Definition
An attribute of a **weak entity** that is unique only within the scope of its owner (strong) entity.
A weak entity cannot be uniquely identified by its own attributes alone - it depends on the owner entity's primary key.

### Use Case
Used when a dependent record only makes sense in the context of a parent record.
Example: A dependent (family member) of an employee is identified by `dep_no`, but that number is only unique per employee - not across all employees.

### Syntax

```sql
-- Strong Entity (owner)
CREATE TABLE employee_strong (
    emp_id      VARCHAR(10),
    emp_name    VARCHAR(100),
    department  VARCHAR(50),
    designation VARCHAR(50),
    salary      DECIMAL(10,2),

    PRIMARY KEY (emp_id)
);

-- Weak Entity (dependent)
CREATE TABLE dependents (
    emp_id    VARCHAR(10),
    dep_no    INT,               -- Partial Key (unique only within each emp_id)
    dep_name  VARCHAR(100),
    relation  VARCHAR(30),
    age       INT,

    PRIMARY KEY (emp_id, dep_no),    -- emp_id + dep_no = full unique identifier
    FOREIGN KEY (emp_id) REFERENCES employee_strong(emp_id)
        ON DELETE CASCADE
);
```

### Rules
- Belongs to a weak entity
- Unique only within the scope of its owner entity
- Represented with a dashed underline in ER diagrams
- Always combined with the owner's primary key to form a full identifier

---

## Bonus: Secondary Key

### Definition
A column used for **searching or retrieving records** but not necessarily unique.
It does not identify a row - it is used to speed up queries using an index.
Implemented using `INDEX` in MySQL.

### Use Case
Used to optimize search/filter queries on frequently queried columns.
Example: Searching employees by `dept` - the department column is a secondary key.

### Syntax

```sql
CREATE TABLE employees_sk (
    emp_id  INT,
    name    VARCHAR(100),
    dept    VARCHAR(50),      -- Secondary Key (used to search by department)
    city    VARCHAR(50),
    salary  DECIMAL(10,2),

    PRIMARY KEY (emp_id),
    INDEX idx_dept (dept)     -- Secondary Key (index for fast search)
);

-- Using Secondary Key to filter records
SELECT * FROM employees_sk WHERE dept = 'IT';
SELECT * FROM employees_sk WHERE dept = 'HR';

-- Verify the index was created
SHOW INDEX FROM employees_sk;
```

### Rules
- Does not need to be unique
- Can contain duplicate values
- Used for performance optimization, not for identification
- Implemented using `INDEX` - not enforced like primary or unique keys

---

## Quick Comparison Table

| Key | Unique | NULL Allowed | Count Per Table | SQL Keyword |
|-----|--------|-------------|-----------------|-------------|
| Primary Key | Yes | No | Only 1 | `PRIMARY KEY` |
| Candidate Key | Yes | No | Multiple | Concept only |
| Super Key | Yes | No | Multiple | Concept only |
| Alternate Key | Yes | No | Multiple | `UNIQUE NOT NULL` |
| Foreign Key | No | Yes | Multiple | `FOREIGN KEY` |
| Composite Key | Yes (combined) | No | Only 1 | `PRIMARY KEY (col1, col2)` |
| Surrogate Key | Yes | No | Only 1 | `AUTO_INCREMENT` |
| Natural Key | Yes | No | Only 1 | `PRIMARY KEY` |
| Unique Key | Yes | One NULL | Multiple | `UNIQUE` |
| Partial Key | Only within owner | No | - | Composite `PRIMARY KEY` |
| Secondary Key | No | Yes | Multiple | `INDEX` |

---

## How to Run the SQL Files

```bash
# Run all key scripts at once
mysql -u root -p < dbms_keys_clean.sql

# Or open in MySQL Workbench
# File > Open SQL Script > Select the file > Execute
```

---

## References

- Ramez Elmasri & Shamkant Navathe -- *Fundamentals of Database Systems*
- C.J. Date -- *An Introduction to Database Systems*
- MySQL 8.0 Reference Manual -- https://dev.mysql.com/doc/