import 'package:flutter/material.dart';

const Color bluishColor = Color(0x35388DFF);
const Color yellowColor = Colors.yellow;
const Color pinkColor = Colors.pink;
const Color white = Colors.white;
const Color primaryColor = bluishColor;
const Color darkGreyColor = Color(0x171515FF);
const Color darkHeaderColor = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkGreyColor,
    brightness: Brightness.dark,
  );
}
