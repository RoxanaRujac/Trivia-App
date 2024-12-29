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
    'assets/images/general_knowledge.jpg',
    'assets/images/sports.jpg',
    'assets/images/history.jpg',
    'assets/images/utcn.jpg',
    'assets/images/movies.jpg',
    'assets/images/music.jpg',
    'assets/images/technology.jpg',
    'assets/images/art.jpg',
    'assets/images/mythology.jpg',
    'assets/images/famous_personalities.jpg',
    'assets/images/travel.jpg',
    'assets/images/psychology.png',
    'assets/images/hobbies.jpg',
    'assets/images/space.jpg',
  ];

  List<String> categories = [
    "General Knowledge",
    "Sports",
    "History",
    "UTCN is a lifestyle",
    "Movies & TV Shows",
    "Music",
    "Technology",
    "Art & Literature",
    "Mythology",
    "Famous Personalities",
    "Travel Destinations",
    "Psychology",
    "Hobbies",
    "Space",
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
      appBar: AppBar(
        title: const Text('Categories'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                          categoryId: 1,
                          numberOfQuestions: 15,
                          timeLimit: 10,
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
