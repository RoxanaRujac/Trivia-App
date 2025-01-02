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
    final url = Uri.parse(
        'http://localhost:3000/questions?category_id=$categoryId');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parsetăm răspunsul și îl salvăm în lista de întrebări
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
  
  Future<void> updateUserQuizProgress(String userEmail) async {
  final url = Uri.parse('http://localhost:3000/update_quiz_progress');
  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'user_email': userEmail,
        'category_id': categoryId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update quiz progress');
    }
  } catch (e) {
    throw Exception('Error updating quiz progress: $e');
  }
}

}