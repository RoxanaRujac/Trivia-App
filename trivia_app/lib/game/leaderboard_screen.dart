import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datele leaderboard-ului
    final List<Map<String, dynamic>> leaderboardData = [
      {'username': 'Alice', 'score': 9500},
      {'username': 'Bob', 'score': 8500},
      {'username': 'Charlie', 'score': 8000},
      {'username': 'Diana', 'score': 7500},
      {'username': 'Edward', 'score': 7000},
      {'username': 'Fiona', 'score': 6500},
      {'username': 'George', 'score': 6000},
      {'username': 'Hannah', 'score': 5500},
      {'username': 'Ian', 'score': 5000},
      {'username': 'Jane', 'score': 4500},
    ];

    // Hardcodat jucătorul care vrei să-l evidențiezi (de exemplu, "Alice")
    final highlightedPlayer = 'Alice';

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
              child: ListView.builder(
                itemCount: leaderboardData.length,
                itemBuilder: (context, index) {
                  final player = leaderboardData[index];
                  final isHighlighted = player['username'] == highlightedPlayer;

                  return Card(
                    elevation: isHighlighted
                        ? 8
                        : 2, // Efect de umbră pentru jucătorul evidențiat
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Colțuri rotunjite
                      side: BorderSide(
                        color: isHighlighted
                            ? const Color.fromARGB(255, 67, 1, 85)
                            : Colors
                                .transparent, // Border elegant pentru jucătorul evidențiat
                        width: 2,
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    // Card-ul va fi semi-transparent pentru a arăta fundalul
                    color: Colors.white.withOpacity(
                        0.4), // Toate cardurile vor fi semi-transparente
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
                          color: isHighlighted ? Colors.white : Colors.black,
                        ),
                      ),
                      trailing: Text(
                        '${player['score']} pts',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isHighlighted ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
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
