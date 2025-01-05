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

  Future<int> getScore(String email, int categoryId) async {
    final url = Uri.parse('http://localhost:3000/select_userscore');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'categoryId': categoryId}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['score'];
      } else if (response.statusCode == 404) {
        return 0;
      } else {
        throw Exception('Failed to fetch score: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching score: $e');
    }
  }

  Future<void> submitScore(String email, int score) async {
    final url = Uri.parse('http://localhost:3000/update_score');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'category_id': categoryId,
          'score': score,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to submit score');
      }
    } catch (e) {
      throw Exception('Error submitting score: $e');
    }
  }
}
