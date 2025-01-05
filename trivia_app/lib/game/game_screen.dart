import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'game_logic.dart';
import 'package:shared_preferences/src/shared_preferences_legacy.dart';

class GameScreen extends StatefulWidget {
  final int categoryId;
  final int numberOfQuestions;
  final int timeLimit; // In minutes

  GameScreen({
    required this.categoryId,
    required this.numberOfQuestions,
    required this.timeLimit,
  });

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GameScreen> {
  bool isLoading = true;
  GameLogic gameLogic = GameLogic(categoryId: 0, numQuestions: 15, timeLimit: 5);

  late Timer _timer;
  int remainingTime = 0; // In seconds
  String? selectedAnswer;
  bool isAnswered = false;
  int correctAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.timeLimit * 60; // Convert minutes to seconds

     print('Category ID: ${widget.categoryId}');
      print('Number of Questions: ${widget.numberOfQuestions}');
      print('Time Limit: ${widget.timeLimit}');

     gameLogic = GameLogic(
    categoryId: widget.categoryId, 
    numQuestions: widget.numberOfQuestions, 
    timeLimit: widget.timeLimit
  );
    startTimer();
    loadQuestions();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Timer logic
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime <= 0) {
        _timer.cancel();
        showTimeUpDialog();
      } else {
        setState(() {
          remainingTime--;
        });
      }
    });
  }

  void showTimeUpDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Time\'s up!'),
        content: Text('You ran out of time. Better luck next time!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              Navigator.pop(context); // Return to the previous screen
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // Load questions using GameLogic
  List<dynamic> usedQuestions = [];

  void loadQuestions() async {
    await gameLogic.fetchQuestions();
    setState(() {
      isLoading = false;
    });
    //no repeats
    gameLogic.questions.shuffle(); //mix mix mix
    gameLogic.questions =
        gameLogic.questions.take(widget.numberOfQuestions).toList();
  }

  Future<String?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('currentUserEmail');
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Game in Progress')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final currentQuestion = gameLogic.getCurrentQuestion();

    if (currentQuestion.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Game in Progress')),
        body: Center(child: Text('No questions available.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Trivia Game'),
        backgroundColor: Color(0xFF6A77B0),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/trivia_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timer container
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFD5CDF8),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                'Time Remaining: ${formatTime(remainingTime)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE5A7EA),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Question container
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFD5CDF8),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                'Question ${gameLogic.currentQuestionIndex + 1}: ${currentQuestion['text']}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 146, 118, 170),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Display the answers in two rows with two buttons per row
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildAnswerButton(currentQuestion['answers'][0]),
                      buildAnswerButton(currentQuestion['answers'][1]),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildAnswerButton(currentQuestion['answers'][2]),
                      buildAnswerButton(currentQuestion['answers'][3]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAnswerButton(dynamic answer) {
    final isCorrect = answer['is_correct'] == 1;
    final isSelected = selectedAnswer == answer['text'];
    final borderColor = isAnswered
        ? (isCorrect
            ? Colors.green
            : (isSelected ? Colors.red : Colors.transparent))
        : Colors.transparent;

    return Container(
      width: 160, // Width for each button
      height: 80, // Height for each button
      margin: EdgeInsets.symmetric(horizontal: 10), // Margin between buttons
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 151, 103, 193),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
          width: 3,
        ),
      ),
      child: ElevatedButton(
        onPressed: isAnswered
            ? null
            : () {
                setState(() {
                  selectedAnswer = answer['text'];
                  isAnswered = true;

                  if (isCorrect) {
                    correctAnswersCount++;
                  }
                });

                // Delay to show correct/incorrect feedback
                Future.delayed(Duration(seconds: 2), () {
                  if (gameLogic.isLastQuestion()) {
                    showGameCompleteDialog();
                  } else {
                    gameLogic.moveToNextQuestion();
                    setState(() {
                      isAnswered = false;
                    });
                  }
                });

              },
        child: Center(
          child: Text(
            answer['text'],
            style: TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 151, 103, 193),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          backgroundColor: Color(0xFFE5A7EA),
          foregroundColor: Colors.black,
          minimumSize: Size(150, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void showGameCompleteDialog() {
    getCurrentUser().then((userEmail) {
      if (userEmail != null) {
        print(userEmail);
        gameLogic.getScore(userEmail, gameLogic.categoryId).then((oldScore) {
          int newScore = oldScore + correctAnswersCount;

          gameLogic.submitScore(userEmail, newScore).then((_) {
            print('Score submitted successfully');
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                title: Text('Game Complete!'),
                content: Text(
                    'Congratulations! You completed the game with $correctAnswersCount correct answers. Your total score is $newScore.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          }).catchError((error) {
            print('Error submitting score: $error');
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                title: Text('Game Complete!'),
                content: Text(
                    'Congratulations! You completed the game with $correctAnswersCount correct answers. However, there was an error saving your score.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          });
        }).catchError((error) {
          print('Error fetching old score: $error');
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text('Game Complete!'),
              content: Text(
                  'Congratulations! You completed the game with $correctAnswersCount correct answers. However, there was an error fetching your old score.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        });
      }
    });
  }
}
