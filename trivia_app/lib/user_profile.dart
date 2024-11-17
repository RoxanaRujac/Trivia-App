import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String email = '';
  String username = 'Loading...';

  // Progresul pentru categorii
  final Map<String, int> categoryProgress = {
    'General Knowledge': 5,
    'Sports': 7,
    'History': 0,
    'UTCN': 3,
    'Movies': 10, // Exemplu: complet deblocat
    'Music': 8,
    'Mythology': 0,
    'Famous Personalities': 2,
    'Travel Destinations': 0,
    'Psychology': 9,
    'Hobbies': 1,
    'Space': 0,
  };

  // Lista de badge-uri unice pentru fiecare categorie
  final Map<String, String> badges = {
    'General Knowledge': 'assets/images/general_knowledge_badge.png',
    'Sports': 'assets/images/sports_badge.png',
    'UTCN': 'assets/images/utcn_badge.png',
    'Movies': 'assets/images/movies_badge.png',
    'Music': 'assets/images/music_badge.png',
    'Psychology': 'assets/images/psychology_badge.png',
    'Famous Personalities': 'assets/images/famous_personalities_badge.png',
    'Hobbies': 'assets/images/hobbies_badge.png',
    'Space': 'assets/images/space_badge.png',
    'Travel Destinations': 'assets/images/travel_badge.png',
    'History': 'assets/images/history_badge.png',
    'Mythology': 'assets/images/mythology_badge.png',
  };
  
  @override
  void initState() {
    super.initState();
    _loadEmailFromPreferences(); // Citim email-ul salvat din fișier
  }

  Future<void> _loadEmailFromPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? savedEmail = prefs.getString('user_email');
      if (savedEmail != null) {
        setState(() {
          email = savedEmail; // Actualizează email-ul în interfață
        });

        // După ce avem email-ul, obținem și numele utilizatorului de pe server
        _fetchUsername(email);
      } else {
        print('No email found in shared_preferences');
      }
    } catch (e) {
      print('Error reading email from shared_preferences: $e');
    }
  }

 Future<void> _fetchUsername(String email) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:3000/getUsername'), // Asigură-te că endpoint-ul este corect
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        username = data['username'] ?? 'Unknown'; // Verificare fallback
      });
    } else {
      print('Failed to fetch username: ${response.body}');
    }
  } catch (e) {
    print('Error fetching username: $e');
  }
}
 
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
                const CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0xFF6A77B0),
                  child: Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                // User name
                Text(
                  username,  // Afișează numele utilizatorului
                  style: const TextStyle(
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
                Text(
                  email,  // Afișează email-ul citit din fișier
                  style: const TextStyle(
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

                // Log Out Button
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    _logout(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xFF6A77B0),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Log Out'),
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
                const SizedBox(height: 40),
                // Badges
                const Text(
                  'CATEGORY PROGRESS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6A77B0),
                  ),
                ),
                const SizedBox(height: 20),
                ...categoryProgress.entries
                    .where((entry) => entry.value > 0 && entry.value < 10)
                    .map((entry) => _buildCategoryProgressBar(entry.key, entry.value)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _showBadgeCollection,
                  child: const Text('View Badge Collection'),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  // Widget pentru un card de realizare
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
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6A77B0),
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

  // Funcția de log out
  void _logout(BuildContext context) {
    // Log out logic (de exemplu, navigare către login screen)
    Navigator.pushReplacementNamed(context, '/login');
  }
  // Widget pentru progres pe categorii
 Widget _buildCategoryProgressBar(String category, int progress) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFF6A77B0), width: 2),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              LinearProgressIndicator(
                value: progress / 10,
                backgroundColor: Colors.grey.shade300,
                color: const Color(0xFF6A77B0),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Image.asset('assets/images/unknown_badge.png', width: 40, height: 40),
      ],
    ),
  );
}


  // Pop-up pentru colecția de badge-uri
  void _showBadgeCollection() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Badge Collection'),
          content: SingleChildScrollView(
            child: Column(
              children: categoryProgress.keys
                  .where((category) => categoryProgress[category] == 10)
                  .map((category) {
                return Row(
                  children: [
                    Image.asset(badges[category]!, width: 50, height: 50),
                    const SizedBox(width: 10),
                    Text(
                      category,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}