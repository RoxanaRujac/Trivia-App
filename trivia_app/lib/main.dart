import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'create_account_screen.dart';
import 'help_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trivia Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/help': (context) => HelpPage(),
        '/login': (context) => LoginScreen(),
        '/create_account': (context) => CreateAccountScreen(),
      },
    );
  }
}
