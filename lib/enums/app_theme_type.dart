// ignore_for_file: constant_identifier_names

/*
 * Project Name:  [Tema1.0] - 
 * File: /Users/bakbeom/work/sm/si/SalesPortal/lib/enums/app_theme.dart
 * Created Date: 2021-09-01 20:12:58
 * Last Modified: 2024-04-29 16:39:42
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright @ 2022  SURGINUS(주). ALL RIGHTS RESERVED. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import 'package:template/styles/app_theme.dart';
import 'package:flutter/material.dart';

import '../styles/export_common.dart';

enum AppThemeType {
  DARK,
  LIGHT,
  TEXT_SMALL,
  TEXT_MEDIUM,
  TEXT_BIG,
  TEXT_BIGGEST
}

extension ThemeTypeExtension on AppThemeType {
  ThemeData get theme {
    switch (this) {
      case AppThemeType.TEXT_SMALL:
        return Apptheme().appTheme.copyWith(
                textTheme: TextTheme(
              headlineSmall: AppTextStyle.bold_16,
              titleMedium: AppTextStyle.w500_14,
              titleSmall: AppTextStyle.default_14,
              bodyMedium: AppTextStyle.default_12,
              bodySmall: AppTextStyle.sub_12,
              labelSmall: AppTextStyle.sub_12,
            ));
      case AppThemeType.TEXT_MEDIUM:
        return Apptheme().appTheme.copyWith(
                textTheme: TextTheme(
              headlineSmall: AppTextStyle.bold_18,
              titleMedium: AppTextStyle.w500_16,
              titleSmall: AppTextStyle.default_16,
              bodyMedium: AppTextStyle.default_14,
              bodySmall: AppTextStyle.sub_12,
              labelSmall: AppTextStyle.sub_14,
            ));
      case AppThemeType.TEXT_BIG:
        return Apptheme().appTheme.copyWith(
                textTheme: TextTheme(
              headlineSmall: AppTextStyle.bold_20,
              titleMedium: AppTextStyle.w500_18,
              titleSmall: AppTextStyle.default_18,
              bodyMedium: AppTextStyle.default_16,
              bodySmall: AppTextStyle.sub_14,
              labelSmall: AppTextStyle.hint_16,
            ));
      case AppThemeType.TEXT_BIGGEST:
        return Apptheme().appTheme.copyWith(
                textTheme: TextTheme(
              headlineSmall: AppTextStyle.bold_22,
              titleMedium: AppTextStyle.w500_22,
              titleSmall: AppTextStyle.default_20,
              bodyMedium: AppTextStyle.default_18,
              bodySmall: AppTextStyle.hint_16,
              labelSmall: AppTextStyle.hint_18,
            ));
      case AppThemeType.DARK:
        return Apptheme().appTheme.copyWith(brightness: Brightness.dark);
      case AppThemeType.LIGHT:
        return Apptheme().appTheme.copyWith(brightness: Brightness.light);
    }
  }

  String get textScale {
    switch (this) {
      case AppThemeType.TEXT_SMALL:
        return 'small';
      case AppThemeType.TEXT_MEDIUM:
        return 'medium';
      case AppThemeType.TEXT_BIG:
        return 'big';
      case AppThemeType.TEXT_BIGGEST:
        return 'biggest';
      default:
        return '';
    }
  }
}

AppThemeType getThemeType(String scale) {
  if (AppThemeType.TEXT_SMALL.textScale == scale) {
    return AppThemeType.TEXT_SMALL;
  } else if (AppThemeType.TEXT_MEDIUM.textScale == scale) {
    return AppThemeType.TEXT_MEDIUM;
  } else if (AppThemeType.TEXT_BIG.textScale == scale) {
    return AppThemeType.TEXT_BIG;
  } else {
    return AppThemeType.TEXT_BIGGEST;
  }
}
