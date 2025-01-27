import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jyothi_labs_test/screens/home.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  String _token = '';
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get token => _token;
  String get errorMessage => _errorMessage;

  Future<void> login(
      String username, String password, BuildContext context) async {
    final url = Uri.parse('https://dummyjson.com/auth/login');
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
          'expiresInMins': 30,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _token = responseData['accessToken'];
        _errorMessage = responseData['message'] ?? 'Login Failed';

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => HomeScreen(),
        //     ));
      }
    } catch (error) {
      _errorMessage = 'Something went wrong: $error';
    }

    _isLoading = false;
    notifyListeners();
  }

  void logOut(BuildContext context) {
    _token = '';
    notifyListeners();
    // Navigator.pop(context);
  }
}
