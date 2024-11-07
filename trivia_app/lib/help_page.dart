import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to Play Trivia'),
        elevation: 5, // Umbra AppBar-ului
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navighează înapoi la pagina anterioară
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 40),
            // PopupMenuButton pentru meniu
            child: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'home') {
                  Navigator.pushNamed(context, '/'); // Mergi la HomeScreen
                } else if (value == 'create_account') {
                  Navigator.pushNamed(
                      context, '/create_account'); // Mergi la Create Account
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
              colors: [Color(0xFFD5CDF8), Color.fromARGB(255, 146, 118, 170)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity, // Folosim lățimea completă
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/trivia_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4),
                BlendMode.dstIn), // Fundal mai estompat
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: const <Widget>[
              Text(
                'How to Play Trivia',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '1. Log in or Create an Account:\nBefore you can start playing, you need to either log in to your existing account or create a new one.\n',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '2. Start a Quiz:\nOnce you’re logged in, you can choose a quiz from the available categories. Each quiz consists of multiple-choice questions.\n',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '3. Answer Questions:\nFor each question, you’ll see four possible answers. Select the answer you think is correct. If you choose the correct one, you earn points!\n',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '4. Time Limit:\nBe quick! Each question has a time limit, so you must answer before time runs out.\n',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '5. Score & Badges:\nAt the end of each quiz, you will receive a score based on how many questions you answered correctly. If you do well, you might unlock a badge or a new level!\n',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '6. Compete with Others:\nYour scores are recorded, and you can check your position in the leaderboard to see how you stack up against other players.\n',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
