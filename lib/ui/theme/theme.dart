import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[100],
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.black,
    ),
  );
}
