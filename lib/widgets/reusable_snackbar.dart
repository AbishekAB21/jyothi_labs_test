import 'package:flutter/material.dart';
import 'package:jyothi_labs_test/utils/fontstyles.dart';

class ShowSnackbar {
  showSnackbar(
    String title,
    Color color,
    BuildContext context,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(title, style: Fontstyles.BodyTextStyle2(context),),
      backgroundColor: color,
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
