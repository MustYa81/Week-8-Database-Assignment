-- Create Books table
CREATE TABLE books (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  isbn VARCHAR(20) UNIQUE NOT NULL,
  publication_year INT,
  publisher_id INT,
  author_id INT,
  category_id INT,
  stock INT DEFAULT 0,
  FOREIGN KEY (publisher_id) REFERENCES publishers(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Create Authors table
CREATE TABLE authors (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  bio TEXT,
  birth_year INT
);

-- Create Members table
CREATE TABLE members (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(20),
  join_date DATE NOT NULL,
  status ENUM('active', 'inactive', 'suspended') DEFAULT 'active'
);

-- Create Loans table
CREATE TABLE loans (
  id INT PRIMARY KEY AUTO_INCREMENT,
  book_id INT NOT NULL,
  member_id INT NOT NULL,
  loan_date DATE NOT NULL,
  due_date DATE NOT NULL,
  return_date DATE,
  FOREIGN KEY (book_id) REFERENCES books(id),
  FOREIGN KEY (member_id) REFERENCES members(id)
);

-- Create Publishers table
CREATE TABLE publishers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  address TEXT,
  contact VARCHAR(100)
);

-- Create Categories table
CREATE TABLE categories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  parent_id INT,
  FOREIGN KEY (parent_id) REFERENCES categories(id)
);

-- Create Reservations table
CREATE TABLE reservations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  book_id INT NOT NULL,
  member_id INT NOT NULL,
  reservation_date DATE NOT NULL,
  status ENUM('pending', 'fulfilled', 'cancelled') DEFAULT 'pending',
  FOREIGN KEY (book_id) REFERENCES books(id),
  FOREIGN KEY (member_id) REFERENCES members(id)
);

-- Create Fines table
CREATE TABLE fines (
  id INT PRIMARY KEY AUTO_INCREMENT,
  loan_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  payment_date DATE,
  FOREIGN KEY (loan_id) REFERENCES loans(id)
);