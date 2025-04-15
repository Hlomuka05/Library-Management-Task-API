// task_manager.js

const express = require('express');
const mysql = require('mysql');
const app = express();

app.use(express.json());

// Database connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'task_manager'
});

db.connect((err) => {
  if (err) {
    console.error('error connecting:', err);
    return;
  }
  console.log('connected as id ' + db.threadId);
});

// Create task
app.post('/tasks', (req, res) => {
  const { title, description, user_id } = req.body;
  const query = 'INSERT INTO tasks SET ?';
  db.query(query, { title, description, user_id }, (err, results) => {
    if (err) {
      console.error('error:', err);
      res.status(500).send({ message: 'Error creating task' });
    } else {
      res.send({ message: 'Task created successfully' });
    }
  });
});

// Read tasks
app.get('/tasks', (req, res) => {
  const query = 'SELECT * FROM tasks';
  db.query(query
