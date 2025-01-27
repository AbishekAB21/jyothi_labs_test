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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Icon(
                Icons.shopping_bag_rounded,
                size: 50,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              SizedBox(
                height: 20,
              ),
              ReusableTextField(
                cntrlr: userNameCntrlr,
                hintText: "Username",
              ),
              SizedBox(
                height: 10,
              ),
              ReusableTextField(
                cntrlr: passwordCntrlr,
                hintText: "Password",
              ),
              SizedBox(
                height: 20,
              ),
              ReusableButton(
                buttontext: "Log in",
                onPressed: () async {
                  final username = userNameCntrlr.text.trim();
                  final password = passwordCntrlr.text.trim();

                  await loginProvider.login(username, password, context);

                  if (loginProvider.errorMessage.isNotEmpty) {
                    ShowSnackbar().showSnackbar(
                        "${loginProvider.errorMessage}", Colors.red, context);
                  } else {
                    ShowSnackbar()
                        .showSnackbar("Logged in", Colors.green, context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
