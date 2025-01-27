import 'package:flutter/material.dart';

class AppStyles {
  static const primaryColor = Color(0xFF6750A4);
  static const secondaryColor = Color(0xFF9C27B0);
  static const accentColor = Color(0xFFE91E63);
  
  static const gradientStart = Color(0xFF6750A4);
  static const gradientEnd = Color(0xFF9C27B0);
  
  // Light Theme Colors
  static const lightBackground = Colors.white;
  static const lightSurface = Color(0xFFF5F5F5);
  static const lightText = Color(0xFF1D1B20);
  static const lightTextSecondary = Color(0xFF49454F);
  
  // Dark Theme Colors
  static const darkBackground = Color(0xFF1D1B20);
  static const darkSurface = Color(0xFF2D2D2D);
  static const darkText = Colors.white;
  static const darkTextSecondary = Color(0xFFCAC4D0);
  
  // Gradients
  static const primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStart, gradientEnd],
  );
  
  // Decorations
  static BoxDecoration cardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );
  
  static BoxDecoration backgroundDecoration({bool isDark = false}) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: isDark
            ? [
                darkBackground,
                darkBackground.withOpacity(0.8),
              ]
            : [
                lightBackground,
                lightBackground.withOpacity(0.8),
              ],
      ),
    );
  }
  
  // Text Styles
  static TextStyle get headlineLarge => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );
  
  static TextStyle get headlineMedium => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle get titleLarge => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  
  static TextStyle get titleMedium => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  
  static TextStyle get bodyLarge => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  
  static TextStyle get bodyMedium => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  
  static TextStyle get labelLarge => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
}
