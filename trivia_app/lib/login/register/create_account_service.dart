import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateAccountService {
  Future<bool> createAccount(
      String username, String email, String password) async {
    try {
      if (username.isEmpty || email.isEmpty || password.isEmpty) {
        print("Please fill in all fields");
        return false;
      }
      final response = await http.post(
        Uri.parse('http://localhost:3000/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        print("Account created successfully");
        return true;
      } else {
        print("Account creation failed. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error occurred: $e");
      return false;
    }
  }
}