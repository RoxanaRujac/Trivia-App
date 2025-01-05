import 'package:flutter/material.dart';
import 'game_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  CategoriesScreenState createState() => CategoriesScreenState();
}

class CategoriesScreenState extends State<CategoriesScreen> {
  String _selectedCategory = "General Knowledge";

  List<String> categoryImages = [
    'assets/images/space.jpg',
    'assets/images/general_knowledge.jpg',
    'assets/images/sports.jpg',
    'assets/images/history.jpg',
    'assets/images/movies.jpg',
    'assets/images/music.jpg',
    'assets/images/technology.jpg',
    'assets/images/art.jpg',
    'assets/images/mythology.jpg',
    'assets/images/famous_personalities.jpg',
    'assets/images/travel.jpg',
    'assets/images/psychology.png',
    'assets/images/hobbies.jpg',
  ];

  Map<String, int> categoryIds = {
    "Space": 1,
    "General Knowledge": 2,
    "Sports": 3,
    "History": 5, // ID 4 lipsește
    "Movies & TV Shows": 6,
    "Music": 7,
    "Technology": 8,
    "Art & Literature": 9,
    "Mythology": 10,
    "Famous Personalities": 11,
    "Travel Destinations": 12,
    "Psychology": 13,
    "Hobbies": 14,
  };

  List<String> categories = [
    "Space",
    "General Knowledge",
    "Sports",
    "History",
    "Movies & TV Shows",
    "Music",
    "Technology",
    "Art & Literature",
    "Mythology",
    "Famous Personalities",
    "Travel Destinations",
    "Psychology",
    "Hobbies",
  ];

  Widget _buildCategoryCard(String category, int i) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      color: Colors.white.withOpacity(0.7),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: Image.asset(categoryImages[i],
            fit: BoxFit.cover, height: 50, width: 50),
        title: Text(
          category,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6A77B0),
          ),
        ),
        trailing: Radio<String>(
          groupValue: _selectedCategory,
          value: category,
          onChanged: (value) {
            setState(() {
              _selectedCategory = value!;
            });
          },
        ),
      ),
    );
  }

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
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/trivia_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7),
              BlendMode.dstIn,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              for (var (index, category) in categories.indexed)
                if (index < categories.length)
                  _buildCategoryCard(category, index),
              const SizedBox(height: 50),
              FractionallySizedBox(
                alignment: Alignment.center,
                widthFactor: 0.42,
                child: ElevatedButton(
                  onPressed: () {

                    final selectedCategoryId =
                        categoryIds[_selectedCategory] ?? 2;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Selected category: $_selectedCategory"),
                      ),
                    );

                    //game page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameScreen(
                          categoryId: selectedCategoryId,
                          numberOfQuestions: 15,
                          timeLimit: 5,
                        ),
                      ),
                    );

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
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text("Start playing"),
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

}

