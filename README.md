# Purrfect Trivia - Trivia Game App

Purrfect Trivia is a trivia-based game where players can answer various types of questions to earn points. The game features multiple categories, challenges between players, leaderboards, and achievements. It has a playful theme, with several elements in the game's design (logo, title icon, badges) inspired by cats.

This project was developed as part of the **Software Engineering 2024-2025** course.


## Table of Contents
1. [Introduction](#introduction)
2. [Technical Details](#technical-details)
3. [Use Case Diagram](#use-case-diagram)
4. [Individual Diagrams](#individual-diagrams)
5. [Design Patterns](#design-patterns)
6. [Database Structure](#database-structure)
7. [Resources](#resources)
8. [Running the Project](#running-the-project)

## Introduction
Purrfect Trivia is a simple trivia game where players can:
- Create an account and log in.
- Choose from multiple game categories (e.g., Space, Sports, History, Movies, Music, etc.).
- Play in **Quick Game** mode or **Challenge** a friend.
- View the **Leaderboard** to see how they rank among other players.
- Access a **Help** page for game instructions.
- View their **Profile** with stats, achievements, and badges.

### Features:
- **Account Creation** (Register)
- **Login** functionality
- **Quick Game Mode** with multiple categories
- **Challenge Mode** for playing against other users
- **Leaderboard** to view top scores
- **Profile Page** for displaying achievements and badges

## Technical Details
### Frontend:
- **Framework**: Flutter
- **Programming Language**: Dart

### Backend:
- **Framework**: Express.js
- **Programming Language**: JavaScript
- **Database**: MySQL

### Application Architecture:
1. **Frontend (Flutter)** communicates with **Backend (Express.js)** using **RESTful API**.
2. **Backend** interacts with the **MySQL database** to retrieve and store data.
3. The **Flow of Data**: 
   - The user sends a request (e.g., login, select questions) from the Flutter app.
   - The request is processed by the **Express.js API**, which performs operations on the MySQL database.
   - The backend responds with the required data, which is displayed on the user's interface.

## Use Case Diagram
Initially, the use case diagram was designed as shown below. As the project evolved, it was updated to meet new requirements:

[**Use Case Diagram**](https://drive.google.com/file/d/1TjiDkUFffaXFgd8_P0CkHt6ripzZZJlZ/view?usp=sharing)

## Individual Diagrams
### Roxana:
- Use Case Diagram for the **Challenge Friend** functionality
- Communication Diagram for the **Game** functionality

### Tania:
- Communication Diagram for the **Categories** functionality
- Activity Diagram for the **Login** functionality

### Ema:
- State Diagram for obtaining **Badges**
- Communication Diagram for displaying the **Score**

## Design Patterns
### Roxana:
- **Builder Pattern** was implemented for the **home_page** class to simplify the creation of similar elements (like buttons) on the page. A `ButtonBuilder` class was created to generate specific types of buttons used in the app.

### Tania:
- **State Management Pattern** was used for the **LeaderboardScreen** class (a StatefulWidget). The internal state is dynamically updated using **setState**, ensuring UI updates whenever the leaderboard data changes.

### Ema:
- **Observer Pattern** was used for managing notifications between classes. A **Subject** (challenge sender) emits notifications, and **Observers** (users receiving challenges) react accordingly.

## Database Structure
The database contains the following tables:
- `user`: stores user information
- `questions`: stores trivia questions
- `answers`: stores possible answers for each question
- `categories`: stores different trivia categories
- `user_achievements`: stores user achievements
- `user_quiz_progress`: stores the user's progress in quizzes
- `achievements`: stores possible achievements
- `challenges`: stores challenges sent between users

**Database Diagram**:
![Database Diagram](link-to-your-database-diagram)

## Resources
You can view the project on **GitHub**:  
[GitHub - Purrfect Trivia](https://github.com/RoxanaRujac/Trivia-App)

## Running the Project
### Prerequisites:
- **Node.js** (for backend)
- **Flutter** (for frontend)
- **MySQL** (for database)

### Steps to Run:

1. **Backend Setup**:
   - Navigate to the `backend` directory in your terminal.
   - Run the following command to install the required dependencies:
     ```bash
     npm install
     ```
   - Start the backend API:
     ```bash
     node app.js
     ```
   - The backend should now be running and connected to the database.

2. **Frontend Setup**:
   - Navigate to the `frontend` directory and run the Flutter application:
     ```bash
     flutter run
     ```

3. **Database Setup**:
   - Ensure that your MySQL server is running.
   - Import the database schema (provided in the project files) to create the necessary tables.

Once everything is set up, you should be able to access the app and play the game!

## Conclusion
Purrfect Trivia combines multithreading, a well-structured architecture, and interactive UI elements to create a fun and engaging trivia experience. With the integration of design patterns, real-time database updates, and user challenges, the project demonstrates practical use of various software engineering principles.
