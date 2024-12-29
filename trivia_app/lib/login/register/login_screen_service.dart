import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenService {
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Salvează email-ul utilizatorului logat în SharedPreferences
        await saveCurrentUser(email);

        print("User logged in successfully");
        return true;
      } else {
        print("Login failed. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error occurred: $e");
      return false;
    }
  }

  // Funcție pentru a salva utilizatorul curent
  Future<void> saveCurrentUser(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentUserEmail', email);
  }
}
