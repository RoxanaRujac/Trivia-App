import 'package:flutter/material.dart';
import 'leaderboard_service.dart'; // Importă LeaderboardService

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  final LeaderboardService _leaderboardService = LeaderboardService();
  String? email;

  @override
  void initState() {
    super.initState();
    _initializeUserProfile();
  }

  Future<void> _initializeUserProfile() async {
    final fetchedEmail = await _leaderboardService.getEmailFromPreferences();
    if (fetchedEmail != null) {
      setState(() {
        email = fetchedEmail;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/trivia_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Top Players',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _leaderboardService.fetchLeaderboard(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                        child: Text('No leaderboard data available.'));
                  }

                  final leaderboardData = snapshot.data!;

                  return ListView.builder(
                    itemCount: leaderboardData.length,
                    itemBuilder: (context, index) {
                      final player = leaderboardData[index];
                      final isHighlighted =
                          email != null && player['username'] == email;

                      return Card(
                        elevation: isHighlighted ? 8 : 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: isHighlighted
                                ? Color.fromARGB(255, 67, 1, 85)
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        color: Colors.white.withOpacity(0.4),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 153, 49, 191),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            player['username'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color:
                                  isHighlighted ? Colors.white : Colors.black,
                            ),
                          ),
                          trailing: Text(
                            '${player['total_score']} pts',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color:
                                  isHighlighted ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
