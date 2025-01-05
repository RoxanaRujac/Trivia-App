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
  List<Map<String, dynamic>> notifications = [];
  List<Map<String, dynamic>> achievements = [];
  late Map<String, int> categoryProgress;
  late Map<String, String> badges;

  bool isAchievementsLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeUserProfile();
    categoryProgress = _logic.getCategoryProgress();
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
    }
  }

  void _logout() {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  void _showBadgeCollection() {
    Map<String, String> earnedBadges = {};
    categoryProgress.forEach((category, progress) {
      if (progress == 10) {
        earnedBadges[category] = badges[category]!;
      }
    });

    // Dacă nu sunt badge-uri câștigate, afișăm un mesaj
    if (earnedBadges.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('No Earned Badges'),
            content: const Text('You have not earned any badges yet.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    } else {
      // Afișăm badge-urile câștigate într-un grid
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('My Badge Collection'),
            content: SizedBox(
              height: 300, // Adjust based on number of badges
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: earnedBadges.length,
                itemBuilder: (BuildContext context, int index) {
                  String category = earnedBadges.keys.elementAt(index);
                  return Column(
                    children: [
                      Image.asset(earnedBadges[category]!,
                          width: 60, height: 60),
                      Text(category, style: const TextStyle(fontSize: 12)),
                    ],
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
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
                child: const Text('View My Badge Collection',
                    style: TextStyle(color: Color(0xFF6A77B0))),
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
        const CircleAvatar(
          radius: 80,
          backgroundColor: Color(0xFF6A77B0),
          child: Icon(Icons.account_circle, size: 100, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Text(
          username,
          style: const TextStyle(
              fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        Text(
          email,
          style: const TextStyle(fontSize: 20, color: Colors.white70),
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
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        notifications.isEmpty
            ? const Center(
                child: Text(
                  'No notifications available.',
                  style: TextStyle(color: Colors.white70),
                ),
              )
            : Column(
                children: notifications
                    .map((notification) => _buildNotificationCard(notification))
                    .toList(),
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

  // Funcția pentru a naviga la ecranul de joc
  void _startPlaying(Map<String, dynamic> notification) async {
    final categoryId = notification['categoryId'];
    final challengerEmail = notification['challengerEmail'];
    final challengedUsername = username;
    final categoryName = notification['categoryName'];
    final numberOfQuestions = notification['numberOfQuestions'];
    final timeLimit = notification['timeLimit'];

    // Trimite cererea de acceptare a provocării
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
        // Dacă totul este OK, navighează la GameScreen
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
    print('Notification Data: $notification'); // Verifică datele
    int categoryId = notification['categoryId'] ?? 0;
    String categoryName = notification['categoryName'] ?? 'Unknown';
    int numberOfQuestions = notification['numberOfQuestions'] ?? 0;
    int timeLimit = notification['timeLimit'] ?? 0;

    print('Category ID: $categoryId'); // Verifică categoria

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
                Navigator.pop(context); // Închide dialogul
                _startPlaying(
                    notification); // Apelează funcția pentru a începe jocul
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
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
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

  Widget _buildAchievementCard(
      String title, String description, String imagePath) {
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
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        ...categoryProgress.entries
            .map((entry) => _buildCategoryProgressBar(entry.key, entry.value)),
      ],
    );
  }

  Widget _buildCategoryProgressBar(String category, int progress) {
    String badgePath =
        progress == 10 ? badges[category]! : 'assets/images/unknown_badge.png';

    return Card(
      child: ListTile(
        title: Text(category),
        subtitle: LinearProgressIndicator(value: progress / 10),
        trailing: Image.asset(badgePath, width: 40, height: 40),
      ),
    );
  }
}
