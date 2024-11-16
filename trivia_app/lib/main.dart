import 'package:flutter/material.dart';
import 'package:trivia_app/main_home_page.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'create_account_screen.dart';
import 'help_page.dart';
import 'categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/home_page': (context) => HomePage(),
        '/categories': (context) => CategoriesScreen(),
      },
    );
  }
}
