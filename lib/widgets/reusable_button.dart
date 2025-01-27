import 'package:flutter/material.dart';
import 'package:jyothi_labs_test/utils/fontstyles.dart';

class ReusableButton extends StatelessWidget {
  String buttontext;
  void Function()? onPressed;
  ReusableButton(
      {super.key, required this.buttontext, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.inversePrimary),
            padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: onPressed,
        child: Text(
          buttontext,
          style: Fontstyles.ButtonTextStyle(context),
        ));
  }
}
