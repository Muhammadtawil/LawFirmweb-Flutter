import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.grey,
          height: 2),
      bodyMedium: TextStyle(height: 2, color: Colors.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);
