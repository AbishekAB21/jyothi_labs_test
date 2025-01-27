// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:jyothi_labs_test/utils/fontstyles.dart';

class ReusableButton extends StatelessWidget {
  String buttontext;
  void Function()? onPressed;

  ReusableButton({
    super.key,
    required this.buttontext,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Theme.of(context).colorScheme.inversePrimary,
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          elevation: WidgetStatePropertyAll(8),
          shadowColor: WidgetStatePropertyAll(
            Colors.black.withOpacity(0.3),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttontext,
          style: Fontstyles.ButtonTextStyle(context).copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
