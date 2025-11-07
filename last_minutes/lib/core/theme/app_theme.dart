import 'package:flutter/material.dart';

// App color palette inspired by cool navy / blue-gray tones
class AppColors {
  AppColors._();

  // Base
  static const Color background = Color(0xFFEEF1F5); // light blue-gray
  static const Color card = Color(0xFFFFFFFF); // clean white cards
  // Brand / Accents
  static const Color accent = Color(0xFF4DA3FF); // sky blue accent
  static const Color muted = Color(0xFF4A5568); // primary text/navy-gray
  static const Color premium = Color(0xFFF4D4BA); // beige for premium highlight
  static const Color appBar = Color(0xFF2F3A4C); // deep navy for top bar

  // UI tokens
  static const Color surfaceBorder = Color(0xFFD4DAE3); // card borders
  static const Color chipSelectedBg = Color(0xFF4A5568);
  static const Color chipUnselectedBg = Color(0xFFE2E8F0);
  static const Color chipText = Color(0xFF4A5568);

  // Time color scale (match web)
  static Color timeColor(int minutes) {
    if (minutes <= 5) return const Color(0xFFB8D4C8);
    if (minutes <= 60) return const Color(0xFF8BA3B5);
    if (minutes <= 119) return const Color(0xFF6B7A91);
    return const Color(0xFFE89B9B);
  }
}

ThemeData buildAppTheme() {
  final base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.accent,
      onPrimary: Colors.white,
      secondary: AppColors.muted,
      surface: AppColors.card,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.muted,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: Colors.white,
      unselectedLabelColor: Color(0xB3FFFFFF), // white 70%
      indicatorColor: Colors.white,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.w700),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
    ),
    textTheme: base.textTheme.apply(
      bodyColor: AppColors.muted,
      displayColor: AppColors.muted,
    ),
    cardTheme: const CardThemeData(
      color: AppColors.card,
      margin: EdgeInsets.zero,
      surfaceTintColor: Colors.transparent,
      elevation: 0.8,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.surfaceBorder),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.card,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      labelStyle: TextStyle(color: AppColors.muted.withValues(alpha: 0.7)),
      hintStyle: TextStyle(color: AppColors.muted.withValues(alpha: 0.6)),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.surfaceBorder),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.accent, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.surfaceBorder),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.chipSelectedBg.withValues(alpha: 0.5);
        }
        return AppColors.surfaceBorder;
      }),
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return Colors.white;
        return AppColors.chipText;
      }),
    ),
    chipTheme: base.chipTheme.copyWith(
      selectedColor: AppColors.chipSelectedBg,
      backgroundColor: AppColors.chipUnselectedBg,
      side: const BorderSide(color: AppColors.surfaceBorder),
      shape: const StadiumBorder(),
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.chipText,
      ),
    ),
  );
}
