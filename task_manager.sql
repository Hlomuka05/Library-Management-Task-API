-- task_manager.sql

-- Create tables
CREATE TABLE users (
  id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE,
  PRIMARY KEY (id)
);

CREATE TABLE tasks (
  id INT AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  user_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments (
  id INT AUTO_INCREMENT,
  task_id INT,
  user_id INT,
  comment TEXT,
  PRIMARY KEY (id),
  FOREIGN KEY (task_id) REFERENCES tasks(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert sample data
INSERT INTO users (name, email) VALUES
  ('John Doe', 'john@example.com'),
  ('Jane Smith', 'jane@example.com');

INSERT INTO tasks (title, description, user_id) VALUES
  ('Task 1', 'This is task 1', 1),
  ('Task 2', 'This is task 2', 2);

INSERT INTO comments (task_id, user_id, comment) VALUES
  (1, 1, 'This is a comment'),
  (2, 2, 'This is another comment');
