import 'package:flutter/material.dart';
import 'package:trivia_app/game_screen.dart';
import 'user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                title: Text('10 Minutes'),
                onTap: () {
                  setState(() {
                    timeLimit = 10;
                  });
                  saveSettings();
                  checkIfReady();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('15 Minutes'),
                onTap: () {
                  setState(() {
                    timeLimit = 15;
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
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Space'),
                onTap: () {
                  setState(() {
                    category = 'space';
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
                    category = 'history';
                  });
                  saveSettings();
                  checkIfReady();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Geography'),
                onTap: () {
                  setState(() {
                    category = 'geography';
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
  }

  Future<void> saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('numberOfQuestions', numberOfQuestions ?? 10);
    await prefs.setInt('timeLimit', timeLimit ?? 5);
    await prefs.setString('category', category ?? 'random');
  }

  //load users usernames
  Future<void> loadUsers() async {
    List<String> fetchedUsers = await userService.fetchUsers();
    setState(() {
      users = fetchedUsers;
    });
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
                    onPressed: () {
                      Map<String, int> categoryMap = {
                        'space': 1,
                        'history': 2,
                        'geography': 3,
                      };

                      // category id
                      int categoryId = categoryMap[category] ?? 1;

                      //game page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameScreen(
                            categoryId: categoryId,
                            numberOfQuestions: numberOfQuestions ?? 10,
                            timeLimit: timeLimit ?? 5,
                          ),
                        ),
                      );
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
