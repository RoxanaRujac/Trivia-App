const express = require('express');
const mysql = require('mysql');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(bodyParser.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root', 
  password: 'root',
  database: 'trivia_db'
});

db.connect((err) => {
  if (err) throw err;
  console.log('Connected to MySQL Database');
});



// Register new user
app.post('/register', (req, res) => {
  const { username, email, password } = req.body;

  if (!username || !email || !password) {
    return res.status(400).json({ message: 'Please provide all required fields' });
  }

  const checkEmailQuery = 'SELECT * FROM user WHERE email = ?';
  db.query(checkEmailQuery, [email], (err, result) => {
    if (err) {
      console.error('Error checking email availability:', err);
      return res.status(500).json({ message: 'Error checking email availability' });
    }

    if (result.length > 0) {
      return res.status(400).json({ message: 'Email already in use' });
    }

    bcrypt.hash(password, 10, (err, hashedPassword) => {
      if (err) {
        console.error('Error hashing password:', err);
        return res.status(500).json({ message: 'Error hashing password' });
      }

      const insertQuery = 'INSERT INTO user (username, email, password, created_at) VALUES (?, ?, ?, NOW())';
      db.query(insertQuery, [username, email, hashedPassword], (err, result) => {
        if (err) {
          console.error('Error registering user:', err);
          return res.status(500).json({ message: 'Error registering user' });
        }
        res.status(200).json({ message: 'User registered successfully' });
      });
    });
  });
});



// User login
app.post('/login', (req, res) => {
  const { email, password } = req.body;

  console.log('Received login request:', req.body);  // Log pentru debugging

  const query = 'SELECT * FROM user WHERE email = ?';
  db.query(query, [email], async (err, results) => {
    if (err || results.length === 0) {
      console.log('Error or user not found:', err);  // Log pentru erori
      return res.status(401).json({ message: 'Authentication failed' });
    }

    const user = results[0];
    console.log('User found:', user);  // Log pentru a verifica utilizatorul din DB

    const isPasswordValid = await bcrypt.compare(password, user.password);
    console.log('Password valid:', isPasswordValid);  // Log pentru validarea parolei

    if (!isPasswordValid) {
      console.log('Incorrect password');  // Log pentru parole incorecte
      return res.status(401).json({ message: 'Incorrect password' });
    }

    // Generate a token (for security purposes)
    const token = jwt.sign({ user_id: user.user_id }, 'your_secret_key', {
      expiresIn: '1h',
    });
    console.log('Generated token:', token);  // Log pentru token generat

    res.json({ message: 'Login successful', token });
  });
});


// get users
app.get('/user', (req, res) => {
  const query = 'SELECT username FROM user';

  db.query(query, (err, results) => {
    if (err) return res.status(500).json({ error: 'Error fetching users' });

    res.json(results); // Returnează lista de utilizatori
  });
});


app.listen(3000, () => {
  console.log(`Server running on port 3000`);
});
