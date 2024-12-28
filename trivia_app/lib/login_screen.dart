import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier<bool>(false);

  LoginScreen({super.key});

  // Funcție pentru a salva email-ul în SharedPreferences
  Future<void> saveEmailToSharedPreferences(String email) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', email); // Salvează email-ul
      print('Email saved to SharedPreferences: $email');
    } catch (e) {
      print('Error saving email: $e');
    }
  }

  // Funcție pentru a loga utilizatorul
  Future<void> login(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      print("User logged in successfully");

      // Salvează email-ul în SharedPreferences
      saveEmailToSharedPreferences(emailController.text);

      // Navighează la pagina de home
      Navigator.pushReplacementNamed(context, '/home_page');
    } else {
      print("Login failed");
      // TODO: Arată un mesaj de eroare în UI
    }
  }

  // Funcție pentru a salva utilizatorul curent
  Future<void> saveCurrentUser(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentUserEmail', email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'home') {
                  Navigator.pushNamed(context, '/');
                } else if (value == 'create_account') {
                  Navigator.pushNamed(context, '/create_account');
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
              icon: const Icon(Icons.menu),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 300,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: ValueListenableBuilder<bool>(
                  valueListenable: _isPasswordVisible,
                  builder: (context, isPasswordVisible, child) {
                    return TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            _isPasswordVisible.value = !isPasswordVisible;
                          },
                        ),
                      ),
                      obscureText: !isPasswordVisible,
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  login(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFF6A77B0),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}