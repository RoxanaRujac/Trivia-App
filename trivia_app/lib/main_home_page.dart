import 'package:flutter/material.dart';

class CustomButtonBuilder {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double borderRadius;
  final double width;
  final EdgeInsets padding;

  CustomButtonBuilder({
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFFE5A7EA),
    this.borderRadius = 20.0,
    this.width = 300.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0),
  });

  Widget build() {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            title: const Text('Welcome Back!'),
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/trivia_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 100),
                Image.asset(
                  'assets/images/logoCat.gif',
                  height: 150,
                ),
                const SizedBox(height: 5),
                CustomButtonBuilder(
                  text: 'Quick Game',
                  onPressed: () {
                    Navigator.pushNamed(context, '/categories');
                  },
                ).build(),
                const SizedBox(height: 15),
                CustomButtonBuilder(
                  text: 'Challenge a Friend',
                  onPressed: () {
                    Navigator.pushNamed(context, '/challenge');
                  },
                ).build(),
                const SizedBox(height: 15),
                CustomButtonBuilder(
                  text: 'Leaderboard',
                  onPressed: () {
                    Navigator.pushNamed(context, '/leaderboard');
                  },
                ).build(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
