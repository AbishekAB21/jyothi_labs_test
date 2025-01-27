import 'package:flutter/material.dart';
import 'package:jyothi_labs_test/screens/log_in.dart';

class SplashProvider with ChangeNotifier {
  Future<void> goHome(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LogInScreen(),
        ));
  }
}
