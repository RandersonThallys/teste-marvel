import 'package:code_hero/src/core/ui/app_colors.dart';
import 'package:code_hero/src/core/ui/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final AppColors colors = AppColors();

  final AppFonts typography = AppFonts();

  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
    );
  }
}
