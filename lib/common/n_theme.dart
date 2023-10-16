import 'package:flutter/material.dart';

class NTheme {
  // Todo : implement theming
  static final lightTheme = ThemeData(scaffoldBackgroundColor: Colors.white);

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey[600],
      appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey));
}
