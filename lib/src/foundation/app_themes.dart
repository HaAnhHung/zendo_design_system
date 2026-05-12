import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'theme_extensions.dart';

/// define custom themes here
final lightTheme = ThemeData(
  brightness: Brightness.light,
  splashColor: Colors.transparent,
)..addAppColor(
    AppThemeType.light,
    AppColors.lightThemeColor,
  );

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
)..addAppColor(
    AppThemeType.dark,
    AppColors.darkThemeColor,
  );
