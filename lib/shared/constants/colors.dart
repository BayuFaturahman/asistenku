import 'package:flutter/material.dart';

class AppColor {
  //BRANDCOLOR

  static const MaterialColor primaryColor = MaterialColor(
    _orangePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF0E5),
      100: Color(0xFFFFE1CC),
      200: Color(0xFFFFC399),
      300: Color(0xFFFFA566),
      400: Color(0xFFFF8733),
      500: Color(_orangePrimaryValue),
      600: Color(0xFFC75200),
      700: Color(0xFF8F3B00),
      800: Color(0xFF572400),
    },
  );
  static const int _orangePrimaryValue = 0xFFFF6900;

  static const MaterialColor secondColor = MaterialColor(
    _secondColorValue,
    <int, Color>{
      50: Color(0xFFFEF2F2),
      100: Color(0xFFFAD6D8),
      200: Color(0xFFF49FA3),
      300: Color(0xFFEE686D),
      400: Color(0xFFE83138),
      500: Color(_secondColorValue),
      600: Color(0xFF8A0F14),
      700: Color(0xFF4F090C),
      800: Color(0xFF130203),
    },
  );
  static const int _secondColorValue = 0xFFC6161D;

  //NEUTRAL
  static const MaterialColor bodyColor = MaterialColor(
    _bodyColorValue,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFAFAFA),
      200: Color(0xFFE1E1E1),
      300: Color(0xFFC7C7C7),
      400: Color(0xFFAEAEAE),
      500: Color(0xFF949494),
      600: Color(0xFF787878),
      700: Color(0xFF5c5c5c),
      800: Color(0xFF404040),
      900: Color(0xFF242424),
    },
  );
  static const int _bodyColorValue = 0xFF242424;

  //ACCENT
  static const Color errorColor = Color(0xFFD95952); //Danger - Use for errors
  static const Color successColor = Color(0xFF5296D6); //Succes - Use for Succes
  static const Color whiteColor = Color(0xFFFFFFFF);

  static const Color weakColor = Color(0xFFBDBDBD); //Weak - Use for secondary text
  static const Color weak2Color = Color(0xFFF6F4F4); //Weak - Use for secondary text

  //GRADIENT
  static const LinearGradient gradient1 = LinearGradient(colors: [
    Color(0XFFFF8D00),
    Color(0XFFFF6900),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);
}
