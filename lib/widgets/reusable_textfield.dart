// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:jyothi_labs_test/utils/fontstyles.dart';

class ReusableTextField extends StatelessWidget {

  final TextEditingController cntrlr;
  final String hintText;
  bool isObscure;
  ReusableTextField({super.key, required this.cntrlr, required this.hintText, required this.isObscure});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        obscureText: isObscure,
        cursorColor: Theme.of(context).colorScheme.inversePrimary,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary),
              borderRadius: BorderRadius.circular(10),
            ),
            hintFadeDuration: Duration(milliseconds: 500),
            hintText: hintText,
            hintStyle: Fontstyles.HintTextStyle(context),
            contentPadding: EdgeInsets.all(15)
            ),
      ),
    );
  }
}
