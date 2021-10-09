import 'package:flutter/material.dart';

class AppTextStyles extends TextTheme {
  final TextTheme textTheme = const TextTheme(
      headline1: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto'
      ),
      headline2: TextStyle(
          fontSize: 27.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto'
      ),
      headline3: TextStyle(
          fontSize: 27.0,
          fontWeight: FontWeight.normal,
          fontFamily: 'Roboto'
      ),
      headline4: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto'
      ),
      headline5: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto'
      ),
      headline6: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
          fontFamily: 'Roboto'
      ),
      subtitle1: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto'
      ),
      subtitle2: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          fontFamily: 'Roboto'
      ),
      bodyText1: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          fontFamily: 'Roboto'
      ),
      bodyText2: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'Roboto'
      ),
      button: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto'
      )
  );

  const AppTextStyles();
}