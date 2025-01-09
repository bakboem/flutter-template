import 'package:template/enums/app_theme_type.dart';
import 'package:template/globalProviders/app_theme_provider.dart';
import 'package:template/services/key_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'app_size.dart';
import 'app_colors.dart';
import 'package:flutter/material.dart';

// 각종 text 스타일 사전 정의.
class AppTextStyle {
  static TextTheme get currentTheme => KeyService.baseAppKey.currentContext!
      .watch<AppThemeProvider>()
      .themeType
      .theme
      .textTheme;
  static TextStyle get h1 => currentTheme.headlineSmall!;
  static TextStyle get h2 => currentTheme.titleMedium!;
  static TextStyle get h3 => currentTheme.titleSmall!;
  static TextStyle get h4 => currentTheme.bodyMedium!;
  static TextStyle get h5 => currentTheme.bodySmall!;
  static TextStyle get h6 => currentTheme.labelSmall!;
  static TextStyle get sub_10 => TextStyle(
      fontSize: AppSize.fontSize(11.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: AppColors.subText);
  static TextStyle get default_10 => TextStyle(
      fontSize: AppSize.fontSize(8.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText);
  static TextStyle get default_12 => TextStyle(
      fontSize: AppSize.fontSize(12.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText);
  static TextStyle get sub_12 => TextStyle(
      fontSize: AppSize.fontSize(12.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: AppColors.subText);
  static TextStyle get default_14 => TextStyle(
      fontSize: AppSize.fontSize(14.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText);
  static TextStyle color14(Color color) => TextStyle(
      fontSize: AppSize.fontSize(14.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: color);
  static TextStyle get sub_14 => TextStyle(
      fontSize: AppSize.fontSize(14.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: AppColors.subText);
  static TextStyle get sub_16 => TextStyle(
      fontSize: AppSize.fontSize(16.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: AppColors.subText);
  static TextStyle get w500_14 => TextStyle(
      fontSize: AppSize.fontSize(14.sp),
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.6,
      color: AppColors.subText);
  static TextStyle get w700_14 => TextStyle(
      fontSize: AppSize.fontSize(14.sp),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.6,
      color: AppColors.subText);
  static TextStyle get spacing_14 => TextStyle(
      fontSize: AppSize.fontSize(14.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: AppColors.subText,
      letterSpacing: -.5);
  static TextStyle get danger_14 => TextStyle(
        fontSize: AppSize.fontSize(14.sp),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: AppColors.dangerColor,
      );
  static TextStyle get w500_16 => TextStyle(
      fontSize: AppSize.fontSize(16.sp),
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText,
      letterSpacing: -.5);

  static TextStyle get default_16 => TextStyle(
      fontSize: AppSize.fontSize(16.sp),
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText,
      letterSpacing: -0.4);
  static TextStyle get default_15 => TextStyle(
      fontSize: AppSize.fontSize(15.sp),
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText,
      letterSpacing: -0.4);
  static TextStyle get spacing_16 => TextStyle(
      fontSize: AppSize.fontSize(16.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText,
      letterSpacing: -.5);
  static TextStyle color_16(Color color) => TextStyle(
      fontSize: AppSize.fontSize(16.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: color);
  static TextStyle colorW500_16(Color color) => TextStyle(
      fontSize: AppSize.fontSize(16.sp),
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.4,
      color: color);
  static TextStyle get hint_16 => TextStyle(
      fontSize: AppSize.fontSize(16.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: AppColors.textFieldUnfoucsColor,
      letterSpacing: -0.3);
  static TextStyle get w500_18 => TextStyle(
      fontSize: AppSize.fontSize(18.sp),
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText,
      letterSpacing: -0.4);

  static TextStyle menu_18(Color color) => TextStyle(
      fontSize: AppSize.fontSize(18.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: color);
  static TextStyle get default_18 => TextStyle(
      fontSize: AppSize.fontSize(18.sp),
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText);
  static TextStyle get appbar_title => TextStyle(
      fontSize: AppSize.fontSize(18.sp),
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText);
  static TextStyle color_18(Color color) => TextStyle(
      fontSize: AppSize.fontSize(18.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: color);
  static TextStyle get hint_18 => TextStyle(
      fontSize: AppSize.fontSize(18.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: AppColors.secondHintColor,
      letterSpacing: -0.3);
  static TextStyle get bold_16 => TextStyle(
      fontSize: AppSize.fontSize(16.sp),
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText.withAlpha((255.0 * .8).round()),
      letterSpacing: -.5);
  static TextStyle get sub_bold_15 => TextStyle(
      fontSize: AppSize.fontSize(15.sp),
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText.withAlpha((255.0 * .8).round()),
      letterSpacing: -.5);
  static TextStyle get temp_bold_18 => TextStyle(
      fontSize: AppSize.fontSize(20.sp),
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText.withAlpha((255.0 * .8).round()),
      letterSpacing: 3.4);
  static TextStyle get bold_18 => TextStyle(
      fontSize: AppSize.fontSize(18.sp),
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText,
      letterSpacing: -0.4);
  static TextStyle get textField_18 => TextStyle(
      fontSize: AppSize.fontSize(18.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText,
      letterSpacing: -0.4);
  static TextStyle get w500_20 => TextStyle(
      fontSize: AppSize.fontSize(20.sp),
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText,
      letterSpacing: -.5);

  static TextStyle get default_20 => TextStyle(
      fontSize: AppSize.fontSize(20.sp),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText);
  static TextStyle get bold_20 => TextStyle(
      fontSize: AppSize.fontSize(20.sp),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText,
      letterSpacing: -.5);
  static TextStyle get bold_22 => TextStyle(
      fontSize: AppSize.fontSize(22.sp),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText,
      letterSpacing: -.5);
  static TextStyle get w500_22 => TextStyle(
      fontSize: AppSize.fontSize(22.sp),
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText,
      letterSpacing: -.5);
  static TextStyle get blod30 => TextStyle(
      fontSize: AppSize.fontSize(30.sp),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText,
      letterSpacing: -.58);
  static TextStyle get blod55 => TextStyle(
      fontSize: AppSize.fontSize(45.sp),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: AppColors.defaultText,
      letterSpacing: -.58);
  static TextStyle bold_20Color(Color color) => TextStyle(
      fontSize: AppSize.fontSize(20.sp),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      letterSpacing: -0.48,
      color: color);
}
