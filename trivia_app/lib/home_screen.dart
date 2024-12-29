import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🏠 Welcome to Trivia',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: const Color.fromARGB(255, 146, 118, 170),
        elevation: 5, // Umbra AppBar-ului
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: () {
              Navigator.pushNamed(
                  context, '/help'); // Navighează la pagina de ajutor
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: Color(0xFF6A77B0),
              child: Icon(Icons.account_circle, size: 30, color: Colors.white),
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFD5CDF8), Color.fromARGB(255, 146, 118, 170)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/trivia_background.jpg'), // Asigură-te că imaginea este în locația corectă
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'The Ultimate Trivia Game\nTest your knowledge with fun quizzes!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700, // Font mai îngroșat
                color: Color.fromARGB(255, 113, 82, 113),
                shadows: [
                  Shadow(
                    offset: Offset(0.5, 0.5), // Umbra subtilă pentru adâncime
                    color: Colors.black26, // Umbra de culoare închisă
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 0.5,
              child: Opacity(
                opacity: 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xFF6A77B0),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Login'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 0.5,
              child: Opacity(
                opacity: 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/create_account');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xFFE5A7EA),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Create an Account'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
