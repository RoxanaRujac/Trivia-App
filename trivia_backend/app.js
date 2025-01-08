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
  host: 'localhost',
  user: 'root', 
  password: 'root',
  database: 'trivia_db'
});

db.connect((err) => {
  if (err) throw err;
  console.log("Connected to MySQL Database");
});

// ------------------------- Register a new user ----------------------

app.post('/register', (req, res) => {

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

app.post('/login', (req, res) => {
  const { email, password } = req.body;

  console.log('Received login request:', req.body);  // debugging log
  const query = "SELECT * FROM user WHERE email = ?";
  db.query(query, [email], async (err, results) => {
    if (err || results.length === 0) {
      console.log('Error or user not found:', err); 

      return res.status(401).json({ message: 'Authentication failed' });
    }

    const user = results[0];
    console.log('User found:', user);  

    const isPasswordValid = await bcrypt.compare(password, user.password);
    console.log('Password valid:', isPasswordValid);  // password validation

    if (!isPasswordValid) {
      console.log('Incorrect password');
      return res.status(401).json({ message: 'Incorrect password' });
    }

    // Generate a token (for security purposes)
    const token = jwt.sign({ user_id: user.user_id }, "your_secret_key", {
      expiresIn: "1h",
    });
    console.log('Generated token:', token);
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





//------------------------------------- Check achievements -------------------------------------


app.post("/check_achievements", (req, res) => {
  const queryUserProgress = `
    SELECT user_email, SUM(completed_quizez) AS total_completed, SUM(score) AS total_score
    FROM user_quiz_progress
    GROUP BY user_email;
  `;

  db.query(queryUserProgress, (err, userProgressResults) => {
    if (err) {
      console.error("Error fetching user progress:", err);
      return res.status(500).json({ message: "Error fetching user progress" });
    }

    if (userProgressResults.length === 0) {
      return res.status(404).json({ message: "No user progress found" });
    }

    const queryAchievements = `SELECT * FROM achievements;`;

    db.query(queryAchievements, (err, achievementsResults) => {
      if (err) {
        console.error("Error fetching achievements:", err);
        return res.status(500).json({ message: "Error fetching achievements" });
      }

      const achievements = {};
      achievementsResults.forEach((achievement) => {
        achievements[achievement.achievement_id] = achievement;
      });

      const userAchievements = [];

      userProgressResults.forEach((userProgress) => {
        const { user_email, total_completed, total_score } = userProgress;

        const completedAchievements = [];

        // Check quiz achievements
        if (total_completed >= 50) {
          completedAchievements.push(7); // Quiz Marathoner
        } else if (total_completed >= 10) {
          completedAchievements.push(6); // Quiz Master
        } else if (total_completed >= 5) {
          completedAchievements.push(5); // Quiz Enthusiast
        } else if (total_completed >= 1) {
          completedAchievements.push(4); // First Quiz Conqueror
        }

        // Check score achievements
        if (total_score >= 5000) {
          completedAchievements.push(3); // Legendary Scorer
        } else if (total_score >= 2500) {
          completedAchievements.push(2); // Master Scorer
        } else if (total_score >= 1000) {
          completedAchievements.push(1); // Rookie Scorer
        }

        completedAchievements.forEach((achievement_id) => {
          userAchievements.push([user_email, achievement_id]);
        });
      });

      if (userAchievements.length > 0) {
        const insertAchievementsQuery = `
          INSERT INTO user_achievements (email, achievement_id)
          VALUES ?
          ON DUPLICATE KEY UPDATE achievement_id = achievement_id;
        `;

        db.query(insertAchievementsQuery, [userAchievements], (err) => {
          if (err) {
            console.error("Error inserting user achievements:", err);
            return res.status(500).json({ message: "Error inserting achievements" });
          }

          return res
            .status(200)
            .json({ message: "Achievements checked and updated successfully" });
        });
      } else {
        return res.status(200).json({ message: "No achievements to update" });
      }
    });
  });
});




//--------------------------------- Update score ----------------------------------------

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




//--------------------------------------- Select user score --------------------------------------------

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




//-----------------------------------Leaderboard -------------------------------------

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






//-------------------------------------- Get achievements ----------------------------------

app.post('/getAchievements', (req, res) => {
  const { email } = req.body;

  if (!email) {
    return res.status(400).json({ message: 'Email is required' });
  }

  // 1. Obținem realizările utilizatorului pe baza email-ului
  const getAchievementsQuery = `
    SELECT a.name, a.description
    FROM achievements a
    JOIN user_achievements ua ON a.achievement_id = ua.achievement_id
    JOIN user u ON u.email = ua.email
    WHERE u.email = ?
  `;
  
  db.query(getAchievementsQuery, [email], (err, achievements) => {
    if (err) {
      console.error('Error fetching achievements:', err);
      return res.status(500).json({ message: 'Error fetching achievements' });
    }

    if (achievements.length === 0) {
      return res.status(404).json({ message: 'No achievements found for this user' });
    }

    // 2. Returnăm realizările utilizatorului
    res.json(achievements);
  });
});




//--------------------------- Save challenge ----------------------------------------------

app.post('/saveChallenge', (req, res) => {
  const {
    challenger_email,
    challenged_username,
    number_of_questions,
    time_limit,
    category,
  } = req.body;

  // Validare parametri
  if (
    !challenger_email ||
    !challenged_username ||
    !number_of_questions ||
    !time_limit ||
    !category
  ) {
    return res.status(400).json({ message: 'All fields are required' });
  }

  // Query pentru a salva provocarea în baza de date
  const query = `
    INSERT INTO challenges 
    (challenger_email, challenged_username, number_of_questions, time_limit, category, status)
    VALUES (?, ?, ?, ?, ?, 'pending')
  `;

  db.query(
    query,
    [challenger_email, challenged_username, number_of_questions, time_limit, category],
    (err, result) => {
      if (err) {
        console.error('Error saving challenge:', err);
        return res.status(500).json({ message: 'Error saving challenge' });
      }

      res.status(201).json({ message: 'Challenge saved successfully' });
    }
  );
});




//----------------------------- Get notifications ----------------------------------------

app.post('/getNotifications', (req, res) => {
  const { username } = req.body;

  console.log('Received request for notifications with username:', username);

  if (!username) {
    console.error('No username provided');
    return res.status(400).json({ message: 'Username is required' });
  }

  const query = `
    SELECT 
      c.challenger_email, 
      u.username AS challenger_username, 
      c.category AS category_name,
      cat.category_id,  -- Adăugăm ID-ul categoriei
      c.number_of_questions, 
      c.time_limit
    FROM challenges c
    INNER JOIN user u ON c.challenger_email = u.email
    INNER JOIN categories cat ON c.category = cat.name  -- Alăturăm tabelul categories pentru a obține ID-ul
    WHERE c.challenged_username = ? AND c.status = 'pending';
  `;

  db.query(query, [username], (err, result) => {
    if (err) {
      console.error('Error during query execution:', err);
      return res.status(500).json({ message: 'Error fetching notifications' });
    }

    console.log('Query result:', result); 

    if (!Array.isArray(result)) {
      console.log('Unexpected response format:', result);
      return res.status(500).json({ message: 'Unexpected response format from DB' });
    }

    if (result.length === 0) {
      return res.status(404).json({ message: 'No notifications found' });
    }

    const formattedNotifications = result.map(notification => ({
      sender: notification.challenger_username || '',
      challengerEmail: notification.challenger_email || '',
      categoryName: notification.category_name || '',
      categoryId: notification.category_id, // ID-ul categoriei
      numberOfQuestions: notification.number_of_questions || 0,
      timeLimit: notification.time_limit || 0,
    }));

    return res.status(200).json(formattedNotifications);
  });
});






// ------------------------------------- Accept challenge -----------------------------------

app.post('/acceptChallenge', (req, res) => {
  const { challengerEmail, challengedUsername, category } = req.body;

  if (!challengerEmail|| !challengedUsername || !category) {
    console.log('Missing fields:', {
      challengerEmail,
      challengedUsername,
      category
    });
    return res.status(400).json({ message: 'Missing required fields' });
  }
  const query = `
    UPDATE challenges
    SET status = 'accepted'
    WHERE challenger_email = ? 
      AND challenged_username = ? 
      AND category = ? 
      AND status = 'pending';
  `;

  db.query(query, [challengerEmail, challengedUsername, category], (err, result) => {
    if (err) {
      console.error('Error updating challenge status:', err);
      return res.status(500).json({ message: 'Error updating challenge status' });
    }

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Challenge not found or already accepted' });
    }

    return res.status(200).json({ message: 'Challenge accepted successfully' });
  });
});





//------------------------------------------ Update progress --------------------------------------

app.post('/update_quiz_progress', (req, res) => {
  const { user_email, category_id } = req.body;

  const query = `
    INSERT INTO user_quiz_progress (user_email, category_id, completed_quizzes)
    VALUES (?, ?, 1)
    ON DUPLICATE KEY UPDATE completed_quizzes = completed_quizzes + 1
  `;

  db.query(query, [user_email, category_id], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).send('Error updating quiz progress');
    }
    res.send('Quiz progress updated successfully');
  });
});





//---------------------------------- Get progress ----------------------------------------

app.post('/getCategoryProgress', (req, res) => {
  const { email } = req.body;

  const query = `
    SELECT c.name, uqp.completed_quizzes
    FROM user_quiz_progress uqp
    JOIN categories c ON uqp.category_id = c.category_id
    WHERE uqp.user_email = ?
  `;

  db.query(query, [email], (err, results) => {
    if (err) {
      console.error('Error fetching category progress:', err);
      return res.status(500).send('Error fetching category progress');
    }

    res.json(results);
  });
});




//--------------------------------- Update profile picture -------------------------------------

app.post('/updateProfilePicture', (req, res) => {
  const { email, profile_pic } = req.body;

  if (!email || !profile_pic) {
    return res.status(400).json({ message: 'Email and profile picture are required.' });
  }

  const query = 'UPDATE user SET profile_pic = ? WHERE email = ? AND profile_pic="default.png"';
  db.query(query, [profile_pic, email], (err, result) => {
    if (err) {
      console.error('Error updating profile picture:', err);
      return res.status(500).json({ message: 'Database error.' });
    }

    if (result.affectedRows > 0) {
      res.status(200).json({ message: 'Profile picture updated successfully.' });
    } else {
      res.status(404).json({ message: 'User not found.' });
    }
  });
});





//------------------------------------ Get profile picture ---------------------------------

app.get('/getProfileImage', (req, res) => {
  const email = req.query.email;

  if (!email) {
    return res.status(400).json({ error: 'Email is required' });
  }

  const query = 'SELECT profile_pic FROM user WHERE email = ?';

  db.query(query, [email], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Database error' });
    }

    if (results.length > 0) {
      const profileImage = results[0].profile_pic || 'default.png'; // Imagine implicită
      res.json({ profileImage });
    } else {
      res.status(404).json({ error: 'User not found' });
    }
  });
});



app.listen(3000, () => {
  console.log(`Server running on port 3000`);
});