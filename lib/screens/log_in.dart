// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:jyothi_labs_test/providers/log_in_provider.dart';
import 'package:jyothi_labs_test/screens/home.dart';
import 'package:jyothi_labs_test/widgets/reusable_button.dart';
import 'package:jyothi_labs_test/widgets/reusable_snackbar.dart';
import 'package:jyothi_labs_test/widgets/reusable_textfield.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  TextEditingController userNameCntrlr = TextEditingController();
  TextEditingController passwordCntrlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
   
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
      
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.shopping_bag_rounded,
                      size: 50,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    SizedBox(height: 20),
                    // Username TextField
                    ReusableTextField(
                      cntrlr: userNameCntrlr,
                      hintText: "Username",
                      isObscure: false,
                    ),
                    SizedBox(height: 15),
                    // Password TextField
                    ReusableTextField(
                      cntrlr: passwordCntrlr,
                      hintText: "Password",
                      isObscure: true,
                    ),
                    SizedBox(height: 25),
                    // Login Button
                    ReusableButton(
                      buttontext: "Log in",
                      onPressed: () async {
                        final username = userNameCntrlr.text.trim();
                        final password = passwordCntrlr.text.trim();

                        await loginProvider.login(username, password, context);

                        if (loginProvider.errorMessage.isNotEmpty) {
                          ShowSnackbar().showSnackbar(
                              "${loginProvider.errorMessage}",
                              Colors.red,
                              context);
                        } else {
                          ShowSnackbar()
                              .showSnackbar("Logged in", Colors.green, context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
