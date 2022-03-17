import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestTheme {
  static var lightText = GoogleFonts.robotoMonoTextTheme(
      const TextTheme(headline1: TextStyle(fontSize: 48, color: Colors.black)));

  static var darkText = GoogleFonts.robotoMonoTextTheme(
      const TextTheme(headline1: TextStyle(fontSize: 48, color: Colors.white)));

  static var lightTheme = ThemeData(
      primaryColor: const Color(0xFFFCA311),
      scaffoldBackgroundColor: Colors.white,
      textTheme: lightText);

  static var darkTheme = ThemeData(
      primaryColor: const Color(0xFFFCA311),
      scaffoldBackgroundColor: Colors.black,
      textTheme: darkText);
}
