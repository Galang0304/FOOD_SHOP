import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primarySwatch: Colors.pink,
      scaffoldBackgroundColor: const Color(0xFFF8E8FF),
      colorScheme: const ColorScheme(
        primary: Color(0xFFE91E63),        // Pink
        secondary: Color(0xFF2196F3),      // Blue
        surface: Colors.white,
        background: Color(0xFFF8E8FF),     // Light Purple
        error: Color(0xFFFF3D00),          // Bright Orange
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xFF1A237E),      // Deep Purple
        onBackground: Color(0xFF1A237E),
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      cardTheme: CardTheme(
        elevation: 8,
        shadowColor: Colors.purple.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFE91E63),
        foregroundColor: Colors.white,
      ),
    );
  }
} 