import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  Future<List<String>> fetchUsers(String currentUserEmail) async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:3000/user?exclude=$currentUserEmail'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> userData = json.decode(response.body);
        return userData.map((user) => user['username'] as String).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}

