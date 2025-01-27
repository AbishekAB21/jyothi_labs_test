import 'package:flutter/material.dart';

class Fontstyles {
  static TextStyle HintTextStyle(BuildContext context) {
    return TextStyle(
        fontSize: 15,
        color: Colors.grey.shade700,
        fontWeight: FontWeight.normal);
  }

  static TextStyle ButtonTextStyle(BuildContext context) {
    return TextStyle(
        fontSize: 18,
        color: Theme.of(context).colorScheme.surface,
        fontWeight: FontWeight.bold);
  }

  static TextStyle HeadlineTextStyle(BuildContext context) {
    return TextStyle(
        fontSize: 18,
        color: Theme.of(context).colorScheme.inversePrimary,
        fontWeight: FontWeight.w600);
  }

  static TextStyle BodyTextStyle(BuildContext context) {
    return TextStyle(
        fontSize: 18,
        color: Theme.of(context).colorScheme.inversePrimary,
        fontWeight: FontWeight.w600);
  }

  static TextStyle BodyTextStyle2(BuildContext context) {
    return TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.inversePrimary,
        fontWeight: FontWeight.w600);
  }

  static TextStyle BodyTextStyle3(BuildContext context) {
    return TextStyle(
        fontSize: 14,
        color: Theme.of(context).colorScheme.inversePrimary,
        fontWeight: FontWeight.w600);
  }
}
