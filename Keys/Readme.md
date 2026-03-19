# DBMS Keys – Concepts and Implementation Guide

A comprehensive reference covering both the theoretical foundations and practical SQL implementations of database keys. Understanding keys is fundamental to database design, normalization, and maintaining data integrity.

---

## Table of Contents

- [What Are Keys?](#what-are-keys)
- [Theoretical Keys](#theoretical-keys)
  - [Super Key](#super-key)
  - [Candidate Key](#candidate-key)
  - [Alternate Key](#alternate-key)
  - [Composite Key (Conceptual)](#composite-key-conceptual)
  - [Partial Key](#partial-key)
  - [Secondary Key](#secondary-key)
- [Practical Keys](#practical-keys)
  - [Primary Key](#primary-key)
  - [Foreign Key](#foreign-key)
  - [Unique Key](#unique-key)
  - [Surrogate Key](#surrogate-key)
  - [Composite Key (Implemented)](#composite-key-implemented)
- [Summary Table](#summary-table)

---

## What Are Keys?

In relational databases, a **key** is an attribute or a set of attributes that is used to uniquely identify a tuple (row) in a relation (table), or to establish a relationship between tables. Keys are central to:

- Enforcing **entity integrity** (each row is uniquely identifiable)
- Enforcing **referential integrity** (relationships between tables remain consistent)
- Driving **normalization** (eliminating redundancy and anomalies)

Keys are broadly classified into two categories: **theoretical keys** (used at the design and modeling stage) and **practical keys** (enforced at the implementation level in SQL).

---

## Theoretical Keys

Theoretical keys exist primarily at the conceptual or logical level. They guide schema design, entity-relationship (ER) modeling, and normalization. Most DBMS engines do not expose them as explicit objects you create with a SQL command, but they underpin why certain design decisions are made.

---

### Super Key

A **super key** is any set of one or more attributes that can uniquely identify every tuple in a relation. It is the most general form of a key.

- A relation can have many possible super keys.
- Super keys may contain unnecessary (redundant) attributes — removing those redundant attributes still preserves uniqueness.
- A super key with no redundant attributes is a **candidate key**.

**Example:**

Consider a `students` table with attributes: `(student_id, email, name, phone)`.

Possible super keys include:
- `{student_id}`
- `{email}`
- `{student_id, email}`
- `{student_id, name}`
- `{student_id, email, name, phone}`

All of the above can uniquely identify a row, but some contain redundant attributes.

> There is no direct SQL syntax to declare a "super key" — it is a design-level concept.

---

### Candidate Key

A **candidate key** is a minimal super key — that is, a super key from which no attribute can be removed without losing the uniqueness property. Every relation must have at least one candidate key.

- Multiple candidate keys may exist in a relation.
- One of them is chosen as the **primary key**; the rest become **alternate keys**.
- A candidate key must satisfy two properties:
  - **Uniqueness**: No two tuples can have the same value for the candidate key.
  - **Irreducibility (Minimality)**: No proper subset of the candidate key can alone guarantee uniqueness.

**Example:**

In the `students` table:
- `{student_id}` — uniquely identifies each student, cannot be reduced further. This is a candidate key.
- `{email}` — also uniquely identifies each student. This is another candidate key.
- `{student_id, email}` — unique, but reducible. This is a super key, NOT a candidate key.

> Candidate keys are identified during schema design. The primary key constraint in SQL is how you enforce your chosen candidate key.

---

### Alternate Key

An **alternate key** is any candidate key that was not selected as the primary key. Once a designer picks one candidate key to serve as the primary key, all remaining candidate keys are called alternate keys.

- Alternate keys still possess the uniqueness and minimality properties of candidate keys.
- They are often enforced using the `UNIQUE` constraint in SQL.

**Example:**

If `student_id` is chosen as the primary key, then `email` becomes an alternate key.

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    email      VARCHAR(100) UNIQUE,  -- alternate key enforced via UNIQUE constraint
    name       VARCHAR(50),
    phone      VARCHAR(15)
);
```

---

### Composite Key (Conceptual)

A **composite key** at the design level refers to any key — super, candidate, or primary — that consists of two or more attributes working together to provide uniqueness. No single attribute in the set is sufficient on its own.

This concept is applied in both theoretical modeling and practical SQL implementation (see [Composite Key – Implemented](#composite-key-implemented)).

**Example:**

In an `enrollments` relation, neither `student_id` alone nor `course_id` alone uniquely identifies an enrollment record, but the combination `{student_id, course_id}` does.

---

### Partial Key

A **partial key** (also called a **discriminator**) is a concept specific to **weak entities** in the Entity-Relationship (ER) model.

A **weak entity** is one that cannot be uniquely identified by its own attributes alone. It depends on a **strong (owner) entity** for its identification. The partial key, combined with the primary key of the owner entity, forms a composite primary key for the weak entity.

**Example:**

Consider a `dependents` entity that represents family members of employees. A dependent named "Aarav" cannot be uniquely identified without knowing which employee they belong to. The `dependent_name` attribute is the partial key; combined with `emp_id` from the `employees` table, it uniquely identifies each dependent.

```sql
CREATE TABLE employees (
    emp_id   INT PRIMARY KEY,
    name     VARCHAR(50)
);

CREATE TABLE dependents (
    emp_id         INT,
    dependent_name VARCHAR(50),
    relationship   VARCHAR(30),
    PRIMARY KEY (emp_id, dependent_name),  -- partial key + owner's PK
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);
```

> `dependent_name` is the partial key. It becomes meaningful only in combination with `emp_id`.

---

### Secondary Key

A **secondary key** is an attribute (or set of attributes) used for data **retrieval purposes** rather than for unique identification. It does not need to be unique and is not used to distinguish one record from another definitively.

- Secondary keys are used to build **indexes** to speed up search queries.
- Multiple records can share the same secondary key value.
- They are a conceptual notion; in practice, they map to **non-unique indexes** in SQL.

**Example:**

In a `products` table, `category` could be a secondary key — you might frequently query products by category, but multiple products share the same category.

```sql
CREATE TABLE products (
    product_id  INT PRIMARY KEY,
    name        VARCHAR(100),
    category    VARCHAR(50),
    price       DECIMAL(10, 2)
);

-- Secondary key implemented as a non-unique index
CREATE INDEX idx_category ON products(category);
```

---

## Practical Keys

Practical keys are enforced by the DBMS at runtime. They are declared using SQL constraints and are responsible for maintaining data integrity in real applications.

---

### Primary Key

A **primary key** uniquely identifies each row in a table. It is the most fundamental constraint in relational databases.

Properties:
- Values must be **unique** across all rows.
- Values must be **NOT NULL** — a primary key column can never contain a null value.
- Each table can have **only one** primary key (though it can span multiple columns as a composite primary key).
- Most DBMS engines automatically create a **unique clustered index** on the primary key column(s).

```sql
CREATE TABLE students (
    id   INT          PRIMARY KEY,
    name VARCHAR(50)  NOT NULL,
    age  INT
);
```

Alternatively, using a table-level constraint (required for composite primary keys):

```sql
CREATE TABLE students (
    id   INT,
    name VARCHAR(50) NOT NULL,
    age  INT,
    PRIMARY KEY (id)
);
```

---

### Foreign Key

A **foreign key** is an attribute (or set of attributes) in one table that references the **primary key** (or a unique key) of another table. It is the mechanism by which relational databases enforce **referential integrity**.

Properties:
- The referencing column's values must either exist in the referenced table or be `NULL` (if the column allows nulls).
- Prevents **orphan records** — rows that reference non-existent parent rows.
- Supports cascading actions: `ON DELETE CASCADE`, `ON UPDATE CASCADE`, `SET NULL`, `RESTRICT`, etc.

```sql
CREATE TABLE departments (
    dept_id   INT          PRIMARY KEY,
    dept_name VARCHAR(50)  NOT NULL
);

CREATE TABLE employees (
    emp_id  INT         PRIMARY KEY,
    name    VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
```

In the above example:
- If a department is deleted, the `dept_id` in `employees` is set to `NULL`.
- If a `dept_id` is updated in `departments`, it cascades to all rows in `employees`.

---

### Unique Key

A **unique key** enforces uniqueness on a column (or group of columns), similar to a primary key but with two important differences:

- A table can have **multiple** unique constraints.
- Unique key columns **can contain NULL values** (behavior varies by DBMS — in most systems, multiple NULLs are permitted since NULL is not considered equal to NULL).

Unique keys are commonly used to enforce business rules such as "no two users can share the same email address."

```sql
CREATE TABLE users (
    id       INT          PRIMARY KEY,
    username VARCHAR(50)  NOT NULL UNIQUE,
    email    VARCHAR(100) UNIQUE
);
```

Table-level syntax for a composite unique constraint:

```sql
CREATE TABLE registrations (
    user_id  INT,
    event_id INT,
    UNIQUE (user_id, event_id)
);
```

---

### Surrogate Key

A **surrogate key** is an artificially generated key with no real-world meaning. It is introduced purely to serve as a unique identifier when no natural candidate key exists, or when the natural key is cumbersome (too long, composite, or subject to change).

Properties:
- Typically an **auto-incremented integer** or a **UUID**.
- Has no business meaning — it exists only within the database.
- Stable: unlike natural keys (e.g., email, phone number), surrogate keys do not change when real-world data changes.

```sql
-- Auto-increment surrogate key (MySQL)
CREATE TABLE orders (
    order_id     INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price        DECIMAL(10, 2)
);

-- Auto-increment surrogate key (PostgreSQL using SERIAL or GENERATED)
CREATE TABLE orders (
    order_id     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price        DECIMAL(10, 2)
);

-- UUID surrogate key (PostgreSQL)
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE sessions (
    session_id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id    INT  NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
```

---

### Composite Key (Implemented)

A **composite key** (also called a **compound key**) is a primary key made up of two or more columns. Neither column alone is sufficient to uniquely identify a row; only their combination guarantees uniqueness.

Composite keys are most commonly used in **junction tables** (also called associative or bridge tables) that resolve many-to-many relationships.

```sql
CREATE TABLE enrollments (
    student_id INT,
    course_id  INT,
    enrolled_on DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id)  REFERENCES courses(course_id)
);
```

In this example:
- A student can enroll in many courses.
- A course can have many students.
- The pair `(student_id, course_id)` uniquely identifies each enrollment record.

---

## Summary Table

| Key Type       | Category    | Unique | Nullable | SQL Enforcement         | Primary Purpose                              |
|----------------|-------------|--------|----------|--------------------------|----------------------------------------------|
| Super Key      | Theoretical | Yes    | -        | None (design concept)    | Understand all possible unique identifiers   |
| Candidate Key  | Theoretical | Yes    | No       | PRIMARY KEY / UNIQUE     | Identify minimal unique attributes           |
| Alternate Key  | Theoretical | Yes    | Varies   | UNIQUE constraint        | Non-chosen candidate keys                    |
| Composite Key  | Both        | Yes    | No (PK)  | PRIMARY KEY (col1, col2) | Multi-column unique identification           |
| Partial Key    | Theoretical | No     | -        | Part of composite PK     | Identify weak entities                       |
| Secondary Key  | Theoretical | No     | Yes      | Non-unique INDEX         | Optimize retrieval queries                   |
| Primary Key    | Practical   | Yes    | No       | PRIMARY KEY              | Uniquely identify each row                   |
| Foreign Key    | Practical   | No     | Yes      | FOREIGN KEY ... REFERENCES | Maintain referential integrity             |
| Unique Key     | Practical   | Yes    | Yes      | UNIQUE                   | Enforce uniqueness on non-PK columns         |
| Surrogate Key  | Practical   | Yes    | No       | AUTO_INCREMENT / IDENTITY | Artificial stable identifier               |

---

## Key Insight

- **Theoretical keys** are design-time concepts. They guide how you model entities, relationships, and constraints before writing a single line of SQL.
- **Practical keys** are what you declare in `CREATE TABLE` statements. They are enforced by the DBMS at runtime to guarantee data integrity.

Understanding both layers makes you a more effective database designer — you think in candidates and supersets when modeling, and in constraints and indexes when implementing.