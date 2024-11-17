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

// Fetch username based on email
app.post('/getUsername', (req, res) => {
  const { email } = req.body;

  if (!email) {
    return res.status(400).json({ message: 'Email is required' });
  }

  const query = 'SELECT username FROM user WHERE email = ?';
  db.query(query, [email], (err, results) => {
    if (err) {
      console.error('Error fetching user profile:', err);
      return res.status(500).json({ message: 'Error fetching user profile' });
    }

    if (results.length === 0) {
      return res.status(404).json({ message: 'User not found' });
    }

    res.json({ username: results[0].username });
  });
});

//quiz
app.get('/questions', (req, res) => {
  const { category_id } = req.query;

  // Interogarea SQL pentru a obține întrebările și răspunsurile corecte
  const query = `
    SELECT 
      q.question_id, 
      q.text AS question_text, 
      a.answer_id,
      a.text AS answer_text, 
      a.is_correct
    FROM questions q
    JOIN answers a ON q.question_id = a.question_id
    WHERE q.category_id = ?
    ORDER BY RAND();
  `;

  db.query(query, [category_id], (err, results) => {
    if (err) {
      console.error('Error fetching questions:', err);
      return res.status(500).json({ message: 'Error fetching questions' });
    }

    console.log('Raw data fetched from DB:', results); // Log pentru debugging

    // Grupăm datele pe baza question_id
    const groupedQuestions = results.reduce((acc, row) => {
      // Verificăm pentru valori null și le înlocuim cu un string gol
      const questionText = row.question_text || ''; // Dacă null, se înlocuiește cu un string gol
      const answerText = row.answer_text || ''; // Dacă null, se înlocuiește cu un string gol

      // Căutăm întrebare deja existentă
      const question = acc.find((q) => q.question_id === row.question_id);
      if (question) {
        // Adăugăm răspunsul la întrebarea existentă
        question.answers.push({
          answer_id: row.answer_id,
          text: answerText,
          is_correct: row.is_correct,
        });
      } else {
        // Creăm o nouă întrebare
        acc.push({
          question_id: row.question_id,
          text: questionText,
          answers: [
            {
              answer_id: row.answer_id,
              text: answerText,
              is_correct: row.is_correct,
            },
          ],
        });
      }
      return acc;
    }, []);

    // Returnăm răspunsul către client
    res.json(groupedQuestions);
  });
});

app.listen(3000, () => {
  console.log(`Server running on port 3000`);
});