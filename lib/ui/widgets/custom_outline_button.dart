import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class CustomOutlineButton extends StatelessWidget {
  String text;
  Color mColor;
  CustomOutlineButton(
    this.text,
    this.mColor, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text(
        "${text}",
        style: TextStyle(color: mColor),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
