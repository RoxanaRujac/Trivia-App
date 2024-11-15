import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'home') {
                  Navigator.pushNamed(context, '/');
                } else if (value == 'create_account') {
                  Navigator.pushNamed(context, '/create_account');
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
              icon: const Icon(Icons.menu),
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
      body: SingleChildScrollView(
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
                // Avatar
                CircleAvatar(
                  radius: 80,
                  backgroundColor: const Color(0xFF6A77B0),
                  child: const Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                // User name
                const Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
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
                // User email
                const Text(
                  'user@example.com',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 5,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                const Text(
                  'Highest score: 2500',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF6A77B0),
                      shadows: [
                      Shadow(
                      offset: Offset(1.0, 1.0),
                  blurRadius: 4.0,
                  color: Colors.black26,
                ),
                  ],
                  ),
                ),
                const SizedBox(height: 40),
                // Notifications Section
                const Text(
                  'NOTIFICATIONS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6A77B0),
                  ),
                ),
                const SizedBox(height: 20),
                _buildNotificationCard(context, 'RandomPlayer challenged you for a quiz!'),
                _buildNotificationCard(context, 'Friend123 challenged you for a quiz!'),
                const SizedBox(height: 40),
                // Achievements Section
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget for a notification card
  // Widget pentru un card de notificare
  Widget _buildNotificationCard(BuildContext context, String notificationText) {
    return InkWell(
      onTap: () {
        // Verificăm dacă textul conține "challenged you" pentru a declanșa acțiunea
        if (notificationText.contains("challenged you")) {
          // Navighează către ecranul de joc
          Navigator.pushNamed(context, '/game_screen');  // Definim '/game_screen' în routings
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF6A77B0), width: 2),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.notifications,
              color: Color(0xFF6A77B0),
              size: 30,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                notificationText,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for an achievement card
  Widget _buildAchievementCard(String title, String description, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF6A77B0), width: 2),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 50, height: 50),
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
