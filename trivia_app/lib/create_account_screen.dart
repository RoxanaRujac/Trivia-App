import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
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
            child:
                // PopupMenuButton pentru meniu
                PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'home') {
                  Navigator.pushNamed(context, '/'); // Mergi la HomeScreen
                } else if (value == 'log_in') {
                  Navigator.pushNamed(
                      context, '/login'); // Rămâi pe LoginScreen
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'home',
                    child: Text('Go to Home'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'log_in',
                    child: Text('Go to Log In'),
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
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/trivia_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(
                  0.4), // Mărim opacitatea pentru fundal mai estompat
              BlendMode.dstIn,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                ),
              ),

              SizedBox(height: 20),
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),

              SizedBox(height: 20),
              Container(
                width: 300,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ),
              SizedBox(height: 40),
              // Butonul Create Account
              FractionallySizedBox(
                alignment: Alignment.center,
                widthFactor: 0.15,
                child: ElevatedButton(
                  onPressed: () {
                    // Logica de creare cont aici
                    print("Account created");
                  },
                  child: Text('Create Account'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Color(
                        0xFFE5A7EA), // Culoare similară cu butonul de pe HomeScreen
                    foregroundColor: Colors.white, // Culoare text
                    textStyle: TextStyle(
                        fontSize: 19,
                        fontWeight:
                            FontWeight.bold), // Stil text similar cu HomeScreen
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
