-- library_management.sql

-- Create tables
CREATE TABLE authors (
  id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE,
  PRIMARY KEY (id)
);

CREATE TABLE books (
  id INT AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  author_id INT,
  publication_date DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE borrowers (
  id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE,
  PRIMARY KEY (id)
);

CREATE TABLE loans (
  id INT AUTO_INCREMENT,
  book_id INT,
  borrower_id INT,
  loan_date DATE,
  return_date DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (book_id) REFERENCES books(id),
  FOREIGN KEY (borrower_id) REFERENCES borrowers(id)
);

-- Insert sample data
INSERT INTO authors (name, email) VALUES
  ('John Doe', 'john@example.com'),
  ('Jane Smith', 'jane@example.com');

INSERT INTO books (title, author_id, publication_date) VALUES
  ('Book 1', 1, '2020-01-01'),
  ('Book 2', 2, '2021-01-01');

INSERT INTO borrowers (name, email) VALUES
  ('Borrower 1', 'borrower1@example.com'),
  ('Borrower 2', 'borrower2@example.com');

INSERT INTO loans (book_id, borrower_id, loan_date, return_date) VALUES
  (1, 1, '2022-01-01', '2022-01-15'),
  (2, 2, '2022-02-01', '2022-02-15');
