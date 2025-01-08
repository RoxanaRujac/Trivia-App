import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LeaderboardService {
  Future<List<Map<String, dynamic>>> fetchLeaderboard() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/leaderboard'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load leaderboard');
      }
    } catch (e) {
      throw Exception('Failed to fetch leaderboard: $e');
    }
  }

  Future<String?> getEmailFromPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('user_email');
    } catch (e) {
      print('Error reading email from shared_preferences: $e');
      return null;
    }
  }
}
