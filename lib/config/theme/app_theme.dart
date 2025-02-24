import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF39A552),
      centerTitle: true,
      shape: RoundedRectangleBorder (
          borderRadius: BorderRadius.circular(20)
      ),
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w400,color:
      Color(0xFFFFFFFF)),
    ),

  );
}
