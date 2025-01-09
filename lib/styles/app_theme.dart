// ignore_for_file: deprecated_member_use

import 'package:template/styles/app_route_page_animation.dart';
import 'package:flutter/material.dart';

import 'export_common.dart';

/// 기본 [ThemeData] 사전 정의 .
/// [AppThemeProvider] 의 base [ThemeData] 이기도 함.
/// .copyWith 함수를 통해 사용자 설정에 맏는 theme를 세팅 해줌.
class Apptheme {
  factory Apptheme() => _sharedInstance();
  static Apptheme? _instance;
  Apptheme._();
  static Apptheme _sharedInstance() {
    _instance ??= Apptheme._();
    return _instance!;
  }

  ThemeData appTheme = ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        foregroundColor: AppColors.defaultText,
        backgroundColor: AppColors.whiteText,
        surfaceTintColor: AppColors.whiteText,
      ),
      colorScheme: const ColorScheme(
          primary: AppColors.primary,
          secondary: AppColors.defaultText,
          surface: AppColors.defaultText,
          background: AppColors.whiteText,
          error: AppColors.dangerColor,
          onPrimary: AppColors.whiteText,
          onSecondary: AppColors.primary,
          onSurface: AppColors.defaultText,
          onBackground: AppColors.defaultText,
          onError: AppColors.primary,
          brightness: Brightness.light),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CustomPageTransitionBuilder(),
          TargetPlatform.iOS:
              CustomPageTransitionBuilder(), // You can define different transitions for iOS if needed
        },
      ),
      dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(AppSize.radius15)))));
}
