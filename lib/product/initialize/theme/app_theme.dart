import 'package:flutter/material.dart';

final class ApplicationTheme {
  ThemeData appTheme() {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.blue),
          foregroundColor: WidgetStateProperty.all(Colors.white),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        iconColor: Colors.blue,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        foregroundColor: Colors.white,
      ),
    );
  }
}