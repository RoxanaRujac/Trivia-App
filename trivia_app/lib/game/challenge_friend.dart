import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trivia_app/game/game_screen.dart';
import 'user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class ChallengeFriendPage extends StatefulWidget {
  @override
  _ChallengeFriendPageState createState() => _ChallengeFriendPageState();
}

class _ChallengeFriendPageState extends State<ChallengeFriendPage> {
  final UserService userService = UserService();
  List<String> users = [];
  String? selectedUser;
  int? numberOfQuestions;
  int? timeLimit;
  String? category;
  bool isReadyForChallenge = false;
  

  //choose the number of questions
  void chooseNumberOfQuestions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Number of Questions'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('10 Questions'),
                onTap: () {
                  setState(() {
                    numberOfQuestions = 10;
                  });
                  saveSettings();
                  checkIfReady(); // all options
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('15 Questions'),
                onTap: () {
                  setState(() {
                    numberOfQuestions = 15;
                  });
                  saveSettings();
                  checkIfReady(); // all options
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('20 Questions'),
                onTap: () {
                  setState(() {
                    numberOfQuestions = 20;
                  });
                  saveSettings();
                  checkIfReady(); // all options
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  //choose time limit
  void chooseTimeLimit(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Time Limit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('3 Minutes'),
                onTap: () {
                  setState(() {
                    timeLimit = 3;
                  });
                  saveSettings();
                  checkIfReady();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('5 Minutes'),
                onTap: () {
                  setState(() {
                    timeLimit = 5;
                  });
                  saveSettings();
                  checkIfReady();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('7 Minutes'),
                onTap: () {
                  setState(() {
                    timeLimit = 7;
                  });
                  saveSettings();
                  checkIfReady();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  //choose category
  void chooseCategory(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Choose Category'),
        content: Container(
          // Make sure the height is enough for scrolling
          height: 300, // Adjust the height if necessary
          child: SingleChildScrollView( // Ensure scrollability
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Space'),
                  onTap: () {
                    setState(() {
                      category = 'Space';
                    });
                    saveSettings();
                    checkIfReady();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('General Knowledge'),
                  onTap: () {
                    setState(() {
                      category = 'General Knowledge';
                    });
                    saveSettings();
                    checkIfReady();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Sports'),
                  onTap: () {
                    setState(() {
                      category = 'Sports';
                    });
                    saveSettings();
                    checkIfReady();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('History'),
                  onTap: () {
                    setState(() {
                      category = 'History';
                    });
                    saveSettings();
                    checkIfReady();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Movies & TV Shows'),
                  onTap: () {
                    setState(() {
                      category = 'Movies & TV Shows';
                    });
                    saveSettings();
                    checkIfReady();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Music'),
                  onTap: () {
                    setState(() {
                      category = 'Music';
                    });
                    saveSettings();
                    checkIfReady();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Technology'),
                  onTap: () {
                    setState(() {
                      category = 'Technology';
                    });
                    saveSettings();
                    checkIfReady();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Art & Literature'),
                  onTap: () {
                    setState(() {
                      category = 'Art & Literature';
                    });
                    saveSettings();
                    checkIfReady();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Mythology'),
                  onTap: () {
                    setState(() {
                      category = 'Mythology';
                    });
                    saveSettings();
                    checkIfReady();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Famous Personalities'),
                  onTap: () {
                    setState(() {
                      category = 'Famous Personalities';
                    });
                    saveSettings();
                    checkIfReady();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Travel Destinations'),
                  onTap: () {
                    setState(() {
                      category = 'Travel Destinations';
                    });
                    saveSettings();
                    checkIfReady();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Psychology'),
                  onTap: () {
                    setState(() {
                      category = 'Psychology';
                    });
                    saveSettings();
                    checkIfReady();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Hobbies'),
                  onTap: () {
                    setState(() {
                      category = 'Hobbies';
                    });
                    saveSettings();
                    checkIfReady();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}



  //check if all options all selected
  void checkIfReady() {
    if (selectedUser != null &&
        numberOfQuestions != null &&
        timeLimit != null &&
        category != null) {
      setState(() {
        isReadyForChallenge = true;
      });
    } else {
      setState(() {
        isReadyForChallenge = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadUsers();
    loadSettings();
  }

  //load to preferences
  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      numberOfQuestions = prefs.getInt('numberOfQuestions');
      timeLimit = prefs.getInt('timeLimit');
      category = prefs.getString('category');
    });
    print('Loaded settings: numberOfQuestions=$numberOfQuestions, timeLimit=$timeLimit, category=$category');

  }


 Future<void> saveSettings() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('numberOfQuestions', numberOfQuestions ?? 10);
  await prefs.setInt('timeLimit', timeLimit ?? 3);
  await prefs.setString('category', category ?? 'general_knowledge');
  print('Saved settings: numberOfQuestions=$numberOfQuestions, timeLimit=$timeLimit, category=$category');

}

  Future<void> resetSettings() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('numberOfQuestions');
  await prefs.remove('timeLimit');
  await prefs.remove('category');
  print('Settings have been reset');
}


  Future<String?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('currentUserEmail');
  }

  //load users usernames
  Future<void> loadUsers() async {
    String? currentUserEmail = await getCurrentUser();
    if (currentUserEmail != null) {
      List<String> fetchedUsers =
          await userService.fetchUsers(currentUserEmail);
      setState(() {
        users = fetchedUsers;
      });
    }
  }

  Future<String?> getEmailFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_email');
}

  Future saveChallenge() async {
    final String apiUrl = 'http://localhost:3000/saveChallenge';
    String? challengerEmail = await getEmailFromSharedPreferences();
    if (challengerEmail == null) {
      print('Email not found in SharedPreferences');
      return;
    }

    if (selectedUser == null || numberOfQuestions == null || timeLimit == null || category == null) {
      print('All fields are required before saving the challenge');
      return;
    }

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "challenger_email": challengerEmail,
        "challenged_username": selectedUser,
        "number_of_questions": numberOfQuestions,
        "time_limit": timeLimit,
        "category": category,
      }),
    );

    if (response.statusCode == 201) {
      print('Challenge saved successfully');
    } else {
      print('Failed to save challenge: ${response.body}');
    }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick a friend for a challenge'),
        backgroundColor: Color(0xFF6A77B0),
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              Navigator.pushNamed(context, '/help');
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/user_profile');
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A77B0), Color(0xFFE5A7EA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/trivia_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 229, 237),
                      borderRadius: BorderRadius.circular(10), // round borders
                    ),
                    child: ListTile(
                      title: Text(
                        user,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 146, 118, 170),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Radio<String>(
                        value: user,
                        groupValue: selectedUser,
                        onChanged: (String? value) {
                          setState(() {
                            selectedUser = value;
                          });
                          checkIfReady(); // if all options are selected
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            //if all options all selected => start button, else => still the 3 buttons
            isReadyForChallenge
                ? ElevatedButton(
                    onPressed: () async{

                     Map<String, int> categoryMap = {
                      'Space': 1,
                      'General Knowledge': 2,
                      'Sports': 3,
                      'History': 5, // ID 4 is missing
                      'Movies & TV Shows': 6,
                      'Music': 7,
                      'Technology': 8,
                      'Art & Literature': 9,
                      'Mythology': 10,
                      'Famous Personalities': 11,
                      'Travel Destinations': 12,
                      'Psychology': 13,
                      'Hobbies': 14,
                    };

                  final categoryId = categoryMap[category] ?? 1;

                  loadSettings();

                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameScreen(
                        categoryId: categoryId,
                        numberOfQuestions: numberOfQuestions ?? 10,
                        timeLimit: timeLimit ?? 3,
                        ),
                      ),
                    );

                      await saveChallenge();
                      await resetSettings(); // Reset settings after saving the challenge
                      
                      setState(() {
                        selectedUser = null;
                        numberOfQuestions = null;
                        timeLimit = null;
                        category = null;
                        isReadyForChallenge = false;
                      });
                    },
                    child: Text('Start Challenge'),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      backgroundColor: Color(0xFFE5A7EA),
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                : Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: selectedUser == null
                            ? null
                            : () {
                                chooseCategory(context);
                              },
                        child: Text('Choose Category'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          backgroundColor: Color(0xFFE5A7EA),
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: selectedUser == null
                            ? null
                            : () {
                                chooseNumberOfQuestions(context);
                              },
                        child: Text('Choose Number of Questions'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          backgroundColor: Color(0xFFE5A7EA),
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: selectedUser == null
                            ? null
                            : () {
                                chooseTimeLimit(context);
                              },
                        child: Text('Choose Time Limit'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          backgroundColor: Color(0xFFE5A7EA),
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
