import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        elevation: 5, // Umbra AppBar-ului
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navighează înapoi la HomeScreen
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 40),
            // PopupMenuButton pentru meniu
            child: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'home') {
                  Navigator.pushNamed(context, '/'); // Mergi la HomeScreen
                } else if (value == 'create_account') {
                  Navigator.pushNamed(
                      context, '/create_account'); // Rămâi pe LoginScreen
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'home',
                    child: Text('Go to Home'),
                  ),
                  PopupMenuItem<String>(
                    value: 'create_account',
                    child: Text('Go to Create Account'),
                  ),
                ];
              },
              icon: Icon(Icons.menu), // Icon-ul meniului
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
            image: AssetImage('assets/images/trivia_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4),
                BlendMode.dstIn), // Fundal mai estompat
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300, // Set your desired width
                child: const TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300, // Set your desired width
                child: const TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Logica de login aici
                  print("User logged in");
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Color(0xFF6A77B0),
                  foregroundColor: Colors.white,
                  textStyle:
                      TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
