import 'dart:convert';
import 'package:http/http.dart' as http;

class GameLogic {
  final int categoryId;
  final int numQuestions;

  List<dynamic> questions = [];
  int currentQuestionIndex = 0;

  GameLogic({required this.categoryId, this.numQuestions = 15});

  List<dynamic> usedQuestions = [];

  Future<void> fetchQuestions() async {
    final url =
        Uri.parse('http://localhost:3000/questions?category_id=$categoryId');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // if success -> parse the response and add it to the list
        questions = json.decode(response.body);
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      throw Exception('Error fetching questions: $e');
    }
  }

  Map<String, dynamic> getCurrentQuestion() {
    if (questions.isEmpty || currentQuestionIndex >= questions.length) {
      return {};
    }
    return questions[currentQuestionIndex];
  }

  List<Map<String, dynamic>> getAnswersForCurrentQuestion() {
    if (questions.isEmpty || currentQuestionIndex >= questions.length) {
      return [];
    }
    return questions[currentQuestionIndex]['answers'];
  }

  void moveToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
    }
  }

  bool isLastQuestion() {
    return currentQuestionIndex == numQuestions - 1;
  }
}
