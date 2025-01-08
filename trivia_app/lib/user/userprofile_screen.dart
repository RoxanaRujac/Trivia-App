import 'package:flutter/material.dart';
import 'package:trivia_app/user/userprofile_logic.dart';
import 'package:trivia_app/game/game_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final UserProfileLogic _logic = UserProfileLogic();

  String email = '';
  String username = '';
  List<Map<String, dynamic>> notifications= [];
  List<Map<String, dynamic>> achievements = [];
  late Map<String, int> categoryProgress = {};
  late Map<String, String> badges;

  bool isAchievementsLoading = true;

  String _profileImage = 'assets/images/default.png';

  final List<String> _profileImages = [
    'assets/images/female.png',
    'assets/images/male.png',
  ];

  @override
  void initState() {
    super.initState();
    _initializeUserProfile();
    badges = _logic.getBadges();
  }

  Future<void> _initializeUserProfile() async {
    final fetchedEmail = await _logic.getEmailFromPreferences();
    if (fetchedEmail != null) {
      setState(() {
        email = fetchedEmail;
      });

      final fetchedUsername = await _logic.fetchUsername(email);
      setState(() {
        username = fetchedUsername;
      });

      final fetchedNotifications = await _logic.fetchNotifications(username);
      setState(() {
        notifications = fetchedNotifications;
      });

      final fetchedAchievements = await _logic.fetchAchievements(email);
      setState(() {
        achievements = fetchedAchievements;
        isAchievementsLoading = false;
      });

      final fetchedCategoryProgress = await _logic.fetchCategoryProgress(email);
      setState(() {
        categoryProgress = fetchedCategoryProgress;
    });

    final fetchedProfileImage = await _logic.fetchProfileImage(email);
    setState(() {
      _profileImage = 'assets/images/$fetchedProfileImage'; // Actualizează imaginea
    });

     await _logic.checkAchievements(email);
    }
  }

  void _logout() {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

void _showBadgeCollection() {
  // Creăm lista de badge-uri pe baza progresului
  List<Map<String, String>> categoryList = [];
  categoryProgress.forEach((category, progress) {
    String badgePath = progress >= 10
        ? badges[category] ?? 'assets/images/unknown_badge.png'
        : 'assets/images/unknown_badge.png'; // Badge necunoscut dacă progresul este < 3

    categoryList.add({
      'category': category,
      'badge': badgePath,
    });
  });

  // Afișăm badge-urile într-un dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('My Badge Collection'),
        content: Container(
          height: 400, // Setează o înălțime fixă
          width: 300,  // Setează o lățime fixă
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 coloane pentru un grid 3x4
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: categoryList.length, // Numărul de badge-uri
            itemBuilder: (BuildContext context, int index) {
              var categoryData = categoryList[index];
              String category = categoryData['category']!;
              String badgePath = categoryData['badge']!;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      badgePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover, // Asigură-te că imaginea se potrivește
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    category,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Închide dialogul
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A77B0), Color(0xFFE5A7EA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/trivia_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildHeader(), // Menține secțiunea de header
              const SizedBox(height: 40),
              _buildNotificationsSection(),
              const SizedBox(height: 40),
              _buildAchievementsSection(),
              const SizedBox(height: 40),
              _buildCategoryProgressSection(),
              const SizedBox(height: 40), // Distanță între secțiuni și buton
              ElevatedButton(
                onPressed: _showBadgeCollection,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: const Text('View My Badge Collection', style: TextStyle(color: Color(0xFF6A77B0))),
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
  return Column(
    children: [
      CircleAvatar(
        radius: 80,
        backgroundColor: const Color(0xFF6A77B0),
        backgroundImage: AssetImage(_profileImage),
      ),
      const SizedBox(height: 20),
      Text(
        username,
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white),
      ),
      Text(
        email,
        style: const TextStyle(fontSize: 20, color: Colors.white70),
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: _showImagePicker,  // Apelează funcția pentru selectarea imaginii
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        child: const Text(
          'Edit Profile Picture',
          style: TextStyle(color: Color(0xFF6A77B0)),
        ),
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: _logout,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        child: const Text('Logout'),
      ),
    ],
  );
}


  Widget _buildNotificationsSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'NOTIFICATIONS',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      const SizedBox(height: 10),
      notifications.isEmpty
          ? const Center(
              child: Text(
                'No notifications available.',
                style: TextStyle(color: Colors.white70),
              ),
            )
          : Column(
              children: notifications.map((notification) => _buildNotificationCard(notification)).toList(),
            ),
    ],
  );
}

Widget _buildNotificationCard(Map<String, dynamic> notification) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: ListTile(
      leading: const Icon(Icons.notifications, color: Color(0xFF6A77B0)),
      title: Text('${notification['sender']} challenged you to a game!'),
      onTap: () {
        _showChallengePopup(notification);
      },
    ),
  );
}

  void _startPlaying(Map<String, dynamic> notification) async {
    final categoryId = notification['categoryId'];
    final challengerEmail = notification['challengerEmail'];
    final challengedUsername = username;
    final categoryName = notification['categoryName'];
    final numberOfQuestions = notification['numberOfQuestions'];
    final timeLimit = notification['timeLimit'];

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/acceptChallenge'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'challengerEmail': challengerEmail,
          'challengedUsername': challengedUsername,
          'category': categoryName,
        }),
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameScreen(
              categoryId: categoryId,
              numberOfQuestions: numberOfQuestions,
              timeLimit: timeLimit,
            ),
          ),
        );
      } else {
        print('Failed to accept challenge: ${response.body}');
      }
    } catch (e) {
      print('Error accepting challenge: $e');
    }
  }

  void _showChallengePopup(Map<String, dynamic> notification) {
    print('Notification Data: $notification');  
    int categoryId = notification['categoryId'] ?? 0;
    String categoryName = notification['categoryName'] ?? 'Unknown';
    int numberOfQuestions = notification['numberOfQuestions'] ?? 0;
    int timeLimit = notification['timeLimit'] ?? 0;

    print('Category ID: $categoryId');  

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Category: $categoryName'),
              Text('Number of Questions: $numberOfQuestions'),
              Text('Time Limit: $timeLimit seconds'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
                _startPlaying(notification); 
              },
              child: const Text('Start Playing'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAchievementsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ACHIEVEMENTS',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        isAchievementsLoading
            ? const Center(child: CircularProgressIndicator())
            : achievements.isEmpty
                ? const Center(
                    child: Text(
                      'No achievements yet.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                : Column(
                    children: achievements.map((achievement) {
                      return _buildAchievementCard(
                        achievement['title'] ?? 'No Title',
                        achievement['description'] ?? 'No Description',
                        achievement['imagePath'] ?? 'assets/images/badge_1.png',
                      );
                    }).toList(),
                  ),
      ],
    );
  }

  Widget _buildAchievementCard(String title, String description, String imagePath) {
    return Card(
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }

  Widget _buildCategoryProgressSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'CATEGORY PROGRESS',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      const SizedBox(height: 10),
      if (categoryProgress.isEmpty)
        const Center(
          child: Text(
            'No category progress available.',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ),
      ...categoryProgress.entries.map((entry) => _buildCategoryProgressBar(entry.key, entry.value)),
    ],
  );
}


Widget _buildCategoryProgressBar(String category, int progress) {
  if (progress >= 10) {
    return Container();
  }

  double progressValue = progress / 10.0;
  String progressFraction = '$progress/10';

  return Card(
    child: ListTile(
      title: Text(category),
      subtitle: Row(
        children: [
          Expanded(
            child: LinearProgressIndicator(value: progressValue),
          ),
          const SizedBox(width: 10), 
          Text(
            progressFraction,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
  
  void _showImagePicker() async {
  final email = await UserProfileLogic().getEmailFromPreferences();
  if (email == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Email not found. Please log in again.')),
    );
    return;
  }

  if (!_profileImage.contains('default.png')) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profile Picture'),
          content: const Text('You already chose a profile picture.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    return; 
  }
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Select Profile Picture'),
        content: Container(
          width: 150,
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _profileImages.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  setState(() {
                    _profileImage = _profileImages[index];
                  });

                  final profilePicName = _profileImages[index].split('/').last; // Extragem doar numele fișierului
                  final success = await UserProfileLogic().updateProfilePicture(email, profilePicName);

                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Profile picture updated successfully.')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to update profile picture.')),
                    );
                  }

                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(_profileImages[index]),
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
}