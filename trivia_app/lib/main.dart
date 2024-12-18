import 'package:flutter/material.dart';
import 'package:trivia_app/challenge_friend.dart';
import 'package:trivia_app/main_home_page.dart';
import 'package:trivia_app/userprofile_screen.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'create_account_screen.dart';
import 'help_page.dart';
import 'categories_screen.dart';
import 'package:permission_handler/permission_handler.dart';


Future<void> requestPermissions() async {
  var status = await Permission.storage.request();
  if (status.isGranted) {
    print("Permisiune de stocare acordată");
  } else {
    print("Permisiune de stocare refuzată");
  }
}
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
        '/': (context) => const HomeScreen(),
        '/help': (context) => const HelpPage(),
        '/login': (context) => LoginScreen(),
        '/create_account': (context) => CreateAccountScreen(),
        '/home_page' : (context) => const HomePage(),
        '/challenge' : (context) => ChallengeFriendPage(),
        '/user_profile' : (context) => UserProfileScreen(),
        '/categories': (context) => CategoriesScreen(),
      },
    );
  }
}