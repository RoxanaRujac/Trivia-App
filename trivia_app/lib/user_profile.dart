import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        elevation: 5, // Umbra AppBar-ului
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navighează înapoi la HomeScreen
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'home') {
                  Navigator.pushNamed(context, '/'); // Mergi la HomeScreen
                } else if (value == 'create_account') {
                  Navigator.pushNamed(context, '/create_account'); // Mergi la Create Account
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'home',
                    child: Text('Go to Home'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'create_account',
                    child: Text('Go to Create Account'),
                  ),
                ];
              },
              icon: const Icon(Icons.menu), // Icon-ul meniului
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFD5CDF8), Color(0xFF6A77B0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(  // Adaugă acest widget pentru a face ecranul scrollabil
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/trivia_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7),
                BlendMode.dstIn,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Avatar cu umbra și fundal
                CircleAvatar(
                  radius: 80,  // Dimensiune mai mare pentru avatar
                  backgroundColor: const Color(0xFF6A77B0), // Culoare de fundal personalizată
                  child: const Icon(
                    Icons.account_circle,
                    size: 100, // Dimensiune iconiță mai mare
                    color: Colors.white, // Culoare iconiță
                  ),
                ),
                const SizedBox(height: 20),
                // Numele utilizatorului
                const Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700, // Font mai gros pentru un impact mai puternic
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 5,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Email-ul utilizatorului
                const Text(
                  'user@example.com',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    fontStyle: FontStyle.italic, // Font mai elegant pentru email
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 5,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Butonul pentru schimbarea parolei
                ElevatedButton(
                  onPressed: () {
                    // Logica pentru schimbarea parolei
                  },
                  child: const Text("Change Password"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xFF6A77B0),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                // Butonul pentru deconectare
                ElevatedButton(
                  onPressed: () {
                    // Logica pentru deconectare
                  },
                  child: const Text("Log Out"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xFFE5A7EA),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40),
                // Secțiunea de Achievements (badge-uri)
                const Text(
                  'ACHIEVEMENTS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6A77B0),
                  ),
                ),
                const SizedBox(height: 20),
                _buildAchievementCard(
                  'BEGINNER',
                  'You have completed 5 quizzes!',
                  'assets/images/badge_1.png',
                ),
                _buildAchievementCard(
                  'TRIVIA MASTER',
                  'You have answered 100 questions correctly!',
                  'assets/images/badge_1.png',
                ),
                _buildAchievementCard(
                  'NEW HIGHSCORE',
                  'You reached a high score in a quiz!',
                  'assets/images/badge_1.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget pentru un card cu realizări (badge-uri)
  Widget _buildAchievementCard(String title, String description, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF6A77B0), width: 2),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 50, height: 50),  // Imaginea badge-ului
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF6A77B0),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
