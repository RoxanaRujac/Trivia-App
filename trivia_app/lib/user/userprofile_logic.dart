import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserProfileLogic {
  Future<String?> getEmailFromPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('user_email');
    } catch (e) {
      print('Error reading email from shared_preferences: $e');
      return null;
    }
  }

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

Future<int> fetchHighscore(String email) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:3000/getHighscore'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return data['highscore'] ?? 0; 
    } else {
      print('Failed to fetch highscore: ${response.body}');
      return 0;
    }
  } catch (e) {
    print('Error fetching highscore: $e');
    return 0;
  }
}


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

  Future<List<Map<String, dynamic>>> fetchAchievements(String email) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/getAchievements'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        return data.map((achievement) {
          return {
            'title': achievement['name'] ?? '',
            'description': achievement['description'] ?? '',
            'imagePath': 'assets/images/badge_1.png',
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

 Future<Map<String, int>> fetchCategoryProgress(String email) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:3000/getCategoryProgress'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      return {
        for (var progress in data)
          progress['name'] != null && progress['completed_quizzes'] != null
              ? progress['name']: 'Unknown Category': progress['completed_quizzes'] ?? 0,
      };
    } else {
      print('Failed to fetch category progress: ${response.body}');
      return {}; 
    }
  } catch (e) {
    print('Error fetching category progress: $e');
    return {}; 
  }
}

  Map<String, String> getBadges() {
    return {
      'General Knowledge': 'assets/images/general_knowledge_badge.png',
      'Sports': 'assets/images/sports_badge.png',
      'Movies': 'assets/images/movies_badge.png',
      'Music': 'assets/images/music_badge.png',
      'Psychology': 'assets/images/psychology_badge.png',
      'Famous Personalities': 'assets/images/famous_personalities_badge.png',
      'Hobbies': 'assets/images/hobbies_badge.png',
      'space': 'assets/images/space_badge.png',
      'Travel Destinations': 'assets/images/travel_badge.png',
      'History': 'assets/images/history_badge.png',
      'Mythology': 'assets/images/mythology_badge.png',
    };
  }

 Future<bool> updateProfilePicture(String email, String profilePic) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:3000/updateProfilePicture'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'profile_pic': profilePic}),
    );

    if (response.statusCode == 200) {
      print('Profile picture updated successfully.');
      return true;
    } else {
      print('Failed to update profile picture: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error updating profile picture: $e');
    return false;
  }
}

Future<String> fetchProfileImage(String email) async {
  final response = await http.get(Uri.parse('http://localhost:3000/getProfileImage?email=$email'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['profileImage'] ?? 'default.png';
  } else {
    throw Exception('Failed to fetch profile image');
  }
}



Future<void> checkAchievements(String email) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:3000/check_achievements'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email}),
    );

    if (response.statusCode == 200) {
      print('Achievements checked and updated successfully.');
    } else {
      print('Failed to check achievements: ${response.body}');
    }
  } catch (e) {
    print('Error checking achievements: $e');
  }
}



}
