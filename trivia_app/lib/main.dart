import 'package:flutter/material.dart';
import 'package:trivia_app/game/categories_screen.dart';
import 'package:trivia_app/game/challenge_friend.dart';
import 'package:trivia_app/main_home_page.dart';
import 'package:trivia_app/user/user_profile.dart';
import 'home_screen.dart';
import 'login/register/login_screen.dart';
import 'login/register/create_account_screen.dart';
import 'help_page.dart';

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
        '/challenge': (context) => ChallengeFriendPage(),
        '/user_profile': (context) => UserProfileScreen(),
        '/categories': (context) => CategoriesScreen(),
      },
    );
  }
}
