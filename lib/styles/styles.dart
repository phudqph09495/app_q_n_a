import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class StyleApp {
  static TextStyle textStyle400({
    Color color = Colors.black,
    double fontSize = 14,
  }) {
    return GoogleFonts.nunito(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle textStyle500({
    Color color = Colors.black,
    double fontSize = 14,
  }) {
    return GoogleFonts.nunito(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle textStyle600({
    Color color = Colors.black,
    double fontSize = 14,
  }) {
    return GoogleFonts.nunito(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle textStyle700({
    Color color = Colors.black,
    double fontSize = 14,
  }) {
    return GoogleFonts.nunito(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle textStyle900({
    Color color = Colors.black,
    double fontSize = 14,
  }) {
    return GoogleFonts.nunito(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w900,
      decoration: TextDecoration.none,
    );
  }
}
