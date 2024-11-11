import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Back, x'),
        backgroundColor: const Color(0xFF6A77B0),
        elevation: 5,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Bine ai venit + statistici
            Text(
              'Ready to test your knowledge?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A77B0),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your Current Score: 500 points',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20),
            
            // Meniu principal
            Text(
              'What would you like to do?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A77B0),
              ),
            ),
            SizedBox(height: 20),

            // Butoane pentru jocuri rapide
            FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Color(0xFF6A77B0),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Start a Quick Game'),
              ),
            ),
            SizedBox(height: 20),

            // Provocări
            FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/challenge');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Color(0xFFE5A7EA),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Challenge a Friend'),
              ),
            ),
            SizedBox(height: 20),

            // Statistici + Leaderboard
            Text(
              'Leaderboard',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A77B0),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('John Doe', style: TextStyle(fontSize: 16)),
                      Text('800 points', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jane Smith', style: TextStyle(fontSize: 16)),
                      Text('750 points', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sam Wilson', style: TextStyle(fontSize: 16)),
                      Text('700 points', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
