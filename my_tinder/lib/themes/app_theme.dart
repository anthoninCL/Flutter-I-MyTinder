import 'package:flutter/material.dart';
import 'package:my_tinder/themes/app_colors.dart';
import 'package:my_tinder/themes/app_textstyles.dart';

@immutable
class AppTheme {
  static const colors = AppColors();
  static const textStyles = AppTextStyles();

  const AppTheme._();
}