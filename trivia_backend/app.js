const express = require("express");
const mysql = require("mysql");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const bodyParser = require("body-parser");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(bodyParser.json());

/*
express: Handles HTTP requests and responses.
mysql: Allows interaction with a MySQL database.
bcrypt: Used to securely hash and compare passwords.
jsonwebtoken: Generates and verifies JWT tokens for user authentication.
body-parser: Parses incoming JSON requests into req.body.
cors: Enables cross-origin requests for the API.
*/

//------------------ Create a connection ---------------------------

const db = mysql.createConnection({
  //host: 'localhost',
  host: "localhost",
  user: "root",
  password: "root",
  database: "trivia_db",
});

db.connect((err) => {
  if (err) throw err;
  console.log("Connected to MySQL Database");
});

// ------------------------- Register a new user ----------------------

app.post("/register", (req, res) => {
  const { username, email, password } = req.body;

  if (!username || !email || !password) {
    return res
      .status(400)
      .json({ message: "Please provide all required fields" });
  }

  const checkEmailQuery = "SELECT * FROM user WHERE email = ?";
  db.query(checkEmailQuery, [email], (err, result) => {
    if (err) {
      console.error("Error checking email availability:", err);
      return res
        .status(500)
        .json({ message: "Error checking email availability" });
    }

    if (result.length > 0) {
      return res.status(400).json({ message: "Email already in use" });
    }

    bcrypt.hash(password, 10, (err, hashedPassword) => {
      if (err) {
        console.error("Error hashing password:", err);
        return res.status(500).json({ message: "Error hashing password" });
      }

      const insertQuery =
        "INSERT INTO user (username, email, password, created_at) VALUES (?, ?, ?, NOW())";
      db.query(
        insertQuery,
        [username, email, hashedPassword],
        (err, result) => {
          if (err) {
            console.error("Error registering user:", err);
            return res.status(500).json({ message: "Error registering user" });
          }
          res.status(200).json({ message: "User registered successfully" });
        }
      );
    });
  });
});

//------------------------------ User login -----------------------------------

app.post("/login", (req, res) => {
  const { email, password } = req.body;

  console.log("Received login request:", req.body); // debugging log

  const query = "SELECT * FROM user WHERE email = ?";
  db.query(query, [email], async (err, results) => {
    if (err || results.length === 0) {
      console.log("Error or user not found:", err);
      return res.status(401).json({ message: "Authentication failed" });
    }

    const user = results[0];
    console.log("User found:", user);

    const isPasswordValid = await bcrypt.compare(password, user.password);
    console.log("Password valid:", isPasswordValid); // password validation

    if (!isPasswordValid) {
      console.log("Incorrect password");
      return res.status(401).json({ message: "Incorrect password" });
    }

    // Generate a token (for security purposes)
    const token = jwt.sign({ user_id: user.user_id }, "your_secret_key", {
      expiresIn: "1h",
    });
    console.log("Generated token:", token);

    res.json({ message: "Login successful", token });
  });
});

//----------------------------- Get list of users --------------------------

app.get("/user", (req, res) => {
  const { exclude } = req.query;

  const query = exclude
    ? "SELECT username FROM user WHERE email != ?"
    : "SELECT username FROM user";

  db.query(query, exclude ? [exclude] : [], (err, results) => {
    if (err) {
      console.error("Error fetching users:", err);
      return res.status(500).json({ message: "Error fetching users" });
    }

    res.json(results);
  });
});

//------------------------ Fetch username based on email ----------------------
app.post("/getUsername", (req, res) => {
  const { email } = req.body;

  if (!email) {
    return res.status(400).json({ message: "Email is required" });
  }

  const query = "SELECT username FROM user WHERE email = ?";
  db.query(query, [email], (err, results) => {
    if (err) {
      console.error("Error fetching user profile:", err);
      return res.status(500).json({ message: "Error fetching user profile" });
    }

    if (results.length === 0) {
      return res.status(404).json({ message: "User not found" });
    }

    res.json({ username: results[0].username });
  });
});

//---------- Get random questions in category + answers for each ------------

app.get("/questions", (req, res) => {
  const { category_id } = req.query;

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
      console.error("Error fetching questions:", err);
      return res.status(500).json({ message: "Error fetching questions" });
    }

    console.log("Raw data fetched from DB:", results); // debugg log

    //group by question_id
    const groupedQuestions = results.reduce((acc, row) => {
      const questionText = row.question_text || ""; //null -> replace with empty string
      const answerText = row.answer_text || ""; //null -> replace with empty string

      //look for already existing question
      const question = acc.find((q) => q.question_id === row.question_id);
      if (question) {
        // add answer
        question.answers.push({
          answer_id: row.answer_id,
          text: answerText,
          is_correct: row.is_correct,
        });
      } else {
        //new question
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

    //respond to client
    res.json(groupedQuestions);
  });
});

app.post("/update_score", (req, res) => {
  const { email, category_id, score } = req.body;

  const checkQuery = `
    SELECT * FROM user_quiz_progress
    WHERE user_email = ? AND category_id = ?;
  `;

  db.query(checkQuery, [email, category_id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send("Error checking quiz progress");
    }

    if (result.length > 0) {
      const updateQuery = `
        UPDATE user_quiz_progress
        SET score = ?, completed_quizzes = completed_quizzes + 1
        WHERE user_email = ? AND category_id = ?;
      `;
      db.query(updateQuery, [score, email, category_id], (err, result) => {
        if (err) {
          console.error(err);
          return res.status(500).send("Error updating score");
        } else {
          return res.status(200).send("Score updated successfully");
        }
      });
    } else {
      const insertQuery = `
        INSERT INTO user_quiz_progress (user_email, category_id, score, completed_quizzes)
        VALUES (?, ?, ?, 1);
      `;
      db.query(insertQuery, [email, category_id, score], (err, result) => {
        if (err) {
          console.error(err);
          console.log(err);
          return res.status(500).send("Error inserting score");
        } else {
          return res.status(200).send("Score inserted successfully");
        }
      });
    }
  });
});

app.post("/select_userscore", (req, res) => {
  const { email } = req.body;

  if (!email) {
    return res.status(400).send("Email is required");
  }

  const query = `
    SELECT score
    FROM user_quiz_progress
    WHERE user_email = ?;
  `;

  db.query(query, [email], (err, result) => {
    if (err) {
      console.error("Error fetching user score:", err);
      return res.status(500).send("Error fetching user score");
    }

    if (result.length > 0) {
      const score = result[0].score;
      return res.status(200).json({ email: email, score: score });
    } else {
      return res.status(404).json({ email: email, score: -1 });
    }
  });
});

app.get("/leaderboard", (req, res) => {
  const query = `
    SELECT user_email AS username, SUM(score) AS total_score
    FROM user_quiz_progress
    GROUP BY user_email
    ORDER BY total_score DESC
    LIMIT 10;
  `;

  db.query(query, (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).send("Error retrieving leaderboard");
    }

    res.status(200).json(results);
  });
});

app.listen(3000, () => {
  console.log("Server running on port 3000");
});
