import 'package:code_hero/src/core/ui/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class AppFonts {
  TextStyle robotoBold27px() => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 27.0,
        fontWeight: FontWeight.bold,
        color: AppColors().redColor,
      );

  TextStyle robotoBold16px() => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: AppColors().redColor,
      );

  TextStyle robotoLight27px() => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 27.0,
        fontWeight: FontWeight.normal,
        color: AppColors().redColor,
      );

  TextStyle robotoLight16px() => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: AppColors().redColor,
      );

  TextStyle robotoRegular16px() => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: AppColors().redColor,
      );

  TextStyle robotoRegular21px() => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 21.0,
        fontWeight: FontWeight.w500,
        color: AppColors().redColor,
      );
}
