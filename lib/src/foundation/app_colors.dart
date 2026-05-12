import 'package:flutter/material.dart';
import 'theme_extensions.dart';

class AppColors {
  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.surfaceContainerLow,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.primaryContainer,
    required this.primaryGradient,
  });

  static late AppColors current;

  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  
  final Color backgroundColor;
  final Color surfaceColor;
  final Color surfaceContainerLow;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
  final Color primaryContainer;

  /// gradient
  final LinearGradient primaryGradient;

  static const lightThemeColor = AppColors(
    primaryColor: Color(0xFF7C4DFF),
    secondaryColor: Color(0xFF00BFA5),
    tertiaryColor: Color(0xFFFF4081),
    primaryTextColor: Color(0xFF1A1A1A),
    secondaryTextColor: Color(0xFF757575),
    backgroundColor: Color(0xFFF8F9FF),
    surfaceColor: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF0F2F9),
    surfaceContainerHigh: Color(0xFFE5E9F2),
    surfaceContainerHighest: Color(0xFFDCE2ED),
    primaryContainer: Color(0xFFEDE7F6),
    primaryGradient: LinearGradient(
      colors: [Color(0xFF7C4DFF), Color(0xFFB388FF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  static const defaultAppColor = lightThemeColor;

  static const darkThemeColor = AppColors(
    primaryColor: Color(0xFFD3BCFC),
    secondaryColor: Color(0xFFA2D3A4),
    tertiaryColor: Color(0xFFFFACC6),
    primaryTextColor: Color(0xFFE7E7E4),
    secondaryTextColor: Color(0xFFACABAA),
    backgroundColor: Color(0xFF0E0E0E),
    surfaceColor: Color(0xFF0E0E0E),
    surfaceContainerLow: Color(0xFF131313),
    surfaceContainerHigh: Color(0xFF1F2020),
    surfaceContainerHighest: Color(0xFF262626),
    primaryContainer: Color(0xFF4F378B),
    primaryGradient: LinearGradient(colors: [Color(0xFFD3BCFC), Color(0xFF5C4880)], begin: Alignment.topLeft, end: Alignment.bottomRight),
  );

  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColor;

    current = appColor;

    return current;
  }

  AppColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? backgroundColor,
    Color? surfaceColor,
    Color? surfaceContainerLow,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? primaryContainer,
    LinearGradient? primaryGradient,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainerHighest: surfaceContainerHighest ?? this.surfaceContainerHighest,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }
}
