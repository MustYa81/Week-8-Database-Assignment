# 📚 Library Management System

A relational database schema for managing books, authors, publishers, categories, members, loans, reservations, and fines in a library.

## 🗂️ Project Overview

This project defines the structure of a **Library Management System** using SQL. It includes entities for storing and managing:

- Books and their authors/publishers
- Library members
- Book loans and returns
- Book reservations
- Fines for late returns
- Nested categories for organizing books

  ## 🧱 Database Schema

The schema includes the following tables:

| Table          | Description                                                             |
| -------------- | ----------------------------------------------------------------------- |
| `books`        | Stores book info; references `authors`, `publishers`, and `categories`. |
| `authors`      | Author details. Referenced by `books`.                                  |
| `publishers`   | Publisher details. Referenced by `books`.                               |
| `categories`   | Book categories with self-referencing hierarchy (`parent_id`).          |
| `members`      | Library members with status (enum).                                     |
| `loans`        | Tracks which member borrowed which book and when.                       |
| `reservations` | Tracks reserved books by members.                                       |
| `fines`        | Linked to `loans`, tracks overdue or penalty payments.                  |



All relationships are implemented via **foreign keys**, and constraints such as `UNIQUE`, `NOT NULL`, `ENUM`, and `AUTO_INCREMENT` are applied for data integrity.

## 📌 Features

- Track books by author, publisher, and category
- Manage library members and their status
- Record loans and due dates
- Log reservations and their fulfillment status
- Apply fines for late book returns
- Support hierarchical book categorization

## 🔗 Entity-Relationship Diagram (ERD)

### 📊 **ERD Structure Summary**

* **One-to-Many Relationships:**

  * One `author` → many `books`
  * One `publisher` → many `books`
  * One `category` → many `books`
  * One `member` → many `loans` and `reservations`
  * One `loan` → one `fine` (if any)
  

## 🛠 Technologies

- SQL (MySQL syntax)
- ERD was created using the online tool: QuickDBD.app

## 📥 Getting Started

1. Clone the repository
2. Run the SQL scripts in a MySQL-compatible environment
3. Use your preferred interface (e.g., MySQL Workbench, DBeaver) to explore the schema


## ✍️ Author

Created by Mustafa Ibrahim 
