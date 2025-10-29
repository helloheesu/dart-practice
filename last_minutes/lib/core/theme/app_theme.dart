import 'package:flutter/material.dart';

// App color palette inspired by warm retro tones
class AppColors {
  AppColors._();

  static const Color background = Color(0xFFF4ECE6);
  static const Color card = Color(0xFFFFF9F3);
  static const Color accent = Color(0xFFF29C85);
  static const Color muted = Color(0xFF7C83A1);
  static const Color premium = Color(0xFFF2D15B);
}

ThemeData buildAppTheme() {
  final base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.accent,
      secondary: AppColors.muted,
      surface: AppColors.card,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    ),
    textTheme: base.textTheme.apply(
      bodyColor: Colors.black87,
      displayColor: Colors.black87,
    ),
    cardTheme: const CardThemeData(
      color: AppColors.card,
      margin: EdgeInsets.zero,
      surfaceTintColor: Colors.transparent,
      elevation: 1.5,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    chipTheme: base.chipTheme.copyWith(
      selectedColor: AppColors.accent.withOpacity(0.18),
      side: const BorderSide(color: Colors.transparent),
      shape: const StadiumBorder(),
    ),
  );
}
