Purrfect Trivia - Trivia Game App
Purrfect Trivia is a trivia-based game where players can answer various types of questions to earn points. The game features multiple categories, challenges between players, leaderboards, and achievements. It has a playful theme, with several elements in the game's design (logo, title icon, badges) inspired by cats.

This project was developed as part of the Software Engineering 2024-2025 course.

Table of Contents
Introduction
Technical Details
Use Case Diagram
Individual Diagrams
Design Patterns
Database Structure
Resources
Running the Project
Introduction
Purrfect Trivia is a simple trivia game where players can:

Create an account and log in.
Choose from multiple game categories (e.g., Space, Sports, History, Movies, Music, etc.).
Play in Quick Game mode or Challenge a friend.
View the Leaderboard to see how they rank among other players.
Access a Help page for game instructions.
View their Profile with stats, achievements, and badges.
Features:
Account Creation (Register)
Login functionality
Quick Game Mode with multiple categories
Challenge Mode for playing against other users
Leaderboard to view top scores
Profile Page for displaying achievements and badges
Technical Details
Frontend:
Framework: Flutter
Programming Language: Dart
Backend:
Framework: Express.js
Programming Language: JavaScript
Database: MySQL
Application Architecture:
Frontend (Flutter) communicates with Backend (Express.js) using RESTful API.
Backend interacts with the MySQL database to retrieve and store data.
The Flow of Data:
The user sends a request (e.g., login, select questions) from the Flutter app.
The request is processed by the Express.js API, which performs operations on the MySQL database.
The backend responds with the required data, which is displayed on the user's interface.
Use Case Diagram
Initially, the use case diagram was designed as shown below. As the project evolved, it was updated to meet new requirements:
