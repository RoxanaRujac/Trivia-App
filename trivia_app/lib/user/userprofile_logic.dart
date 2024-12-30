import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserProfileLogic {
  // Obține email-ul din SharedPreferences
  Future<String?> getEmailFromPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('user_email');
    } catch (e) {
      print('Error reading email from shared_preferences: $e');
      return null;
    }
  }

  // Fetch username de la server
  Future<String> fetchUsername(String email) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/getUsername'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['username'] ?? 'Unknown';
      } else {
        print('Failed to fetch username: ${response.body}');
        return 'Unknown';
      }
    } catch (e) {
      print('Error fetching username: $e');
      return 'Unknown';
    }
  }

  // Fetch notificările de la server
  Future<List<Map<String, dynamic>>> fetchNotifications(String username) async {
    print('Fetching notifications for username: $username');
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/getNotifications'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;

        // Mapăm notificările pentru a le returna în forma dorită
        return data.map((notification) {
          return {
            'sender': notification['sender'] ?? '',
            'challengerEmail': notification['challengerEmail'] ?? '',
            'categoryName': notification['categoryName'] ?? '',
            'categoryId': notification['categoryId'] ?? 0,
            'numberOfQuestions': notification['numberOfQuestions'] ?? 0,
            'timeLimit': notification['timeLimit'] ?? 0,
          };
        }).toList();
      } else {
        print('Failed to fetch notifications: ${response.body}');
        return [];
      }
    } catch (e) {
      print('Error fetching notifications: $e');
      return [];
    }
  }

  // Fetch realizările din API
  Future<List<Map<String, dynamic>>> fetchAchievements(String email) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/getAchievements'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;

        // Mapăm realizările pentru a le returna în forma dorită
        return data.map((achievement) {
          return {
            'title': achievement['name'] ?? '',
            'description': achievement['description'] ?? '',
            'imagePath':
                'assets/images/badge_1.png', // Folosim un imagePath implicit
          };
        }).toList();
      } else {
        print('Failed to fetch achievements: ${response.body}');
        return [];
      }
    } catch (e) {
      print('Error fetching achievements: $e');
      return [];
    }
  }

  // Exemplu de progres pe categorii
  Map<String, int> getCategoryProgress() {
    return {
      'General Knowledge': 5,
      'Sports': 7,
      'History': 0,
      'UTCN': 3,
      'Movies': 10,
      'Music': 8,
      'Mythology': 0,
      'Famous Personalities': 2,
      'Travel Destinations': 0,
      'Psychology': 9,
      'Hobbies': 1,
      'Space': 0,
    };
  }

  // Exemplu de badge-uri per categorie
  Map<String, String> getBadges() {
    return {
      'General Knowledge': 'assets/images/general_knowledge_badge.png',
      'Sports': 'assets/images/sports_badge.png',
      'UTCN': 'assets/images/utcn_badge.png',
      'Movies': 'assets/images/movies_badge.png',
      'Music': 'assets/images/music_badge.png',
      'Psychology': 'assets/images/psychology_badge.png',
      'Famous Personalities': 'assets/images/famous_personalities_badge.png',
      'Hobbies': 'assets/images/hobbies_badge.png',
      'Space': 'assets/images/space_badge.png',
      'Travel Destinations': 'assets/images/travel_badge.png',
      'History': 'assets/images/history_badge.png',
      'Mythology': 'assets/images/mythology_badge.png',
    };
  }
}
