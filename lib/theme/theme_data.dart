import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: const Color.fromARGB(255, 245, 235, 220),
    primary: const Color.fromARGB(255, 252, 246, 236),
    secondary: Colors.grey.shade400,
    surface: Colors.white,
    onSurface: Colors.black,
    onPrimary: Colors.grey.shade600,
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: const Color.fromARGB(255, 80, 35, 20),
        displayColor: Colors.black,
      ),
);
