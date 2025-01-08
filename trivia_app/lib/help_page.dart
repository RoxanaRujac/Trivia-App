import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A77B0), Color(0xFFE5A7EA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: const Text('How to play'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.help),
                onPressed: () {
                  Navigator.pushNamed(context, '/help');
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.pushNamed(context, '/user_profile');
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/trivia_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.dstIn,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              const Text(
                'How to Play Trivia',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6A77B0),
                ),
              ),
              const SizedBox(height: 20),
              _buildStepCard(
                'Log in or Create an Account',
                'Before you can start playing, you need to either log in to your existing account or create a new one.',
                Icons.login,
                const Color(0xFF6A77B0),
              ),
              _buildStepCard(
                'Start a Quiz',
                'Once you’re logged in, you can choose a quiz from the available categories. Each quiz consists of multiple-choice questions.',
                Icons.quiz,
                const Color(0xFF6A77B0),
              ),
              _buildStepCard(
                'Answer Questions',
                'For each question, you’ll see four possible answers. Select the answer you think is correct. If you choose the correct one, you earn points!',
                Icons.question_answer,
                const Color(0xFF6A77B0),
              ),
              _buildStepCard(
                'Time Limit',
                'Be quick! Each question has a time limit, so you must answer before time runs out.',
                Icons.timer,
                const Color(0xFF6A77B0),
              ),
              _buildStepCard(
                'Score & Badges',
                'At the end of each quiz, you will receive a score based on how many questions you answered correctly. If you do well, you might unlock a badge or a new level!',
                Icons.score,
                const Color(0xFF6A77B0),
              ),
              _buildStepCard(
                'Compete with Others',
                'Your scores are recorded, and you can check your position in the leaderboard to see how you stack up against other players.',
                Icons.leaderboard,
                const Color(0xFF6A77B0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard(
      String title, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
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
