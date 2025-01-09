/*
 * Project Name:  [mKolon3.0] - MedicalSalesPortal
 * File: /Users/bakbeom/work/sm/si/medsalesportal/lib/styles/app_text.dart
 * Created Date: 2022-07-03 14:42:12
 * Last Modified: 2024-10-08 21:14:50
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright @ 2022  SURGINUS(주). ALL RIGHTS RESERVED. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import 'package:template/globalProviders/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'export_common.dart';

class AppText {
  static text(
    String data, {
    TextStyle? style,
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
  }) =>
      Text(data,
          style: style ?? AppTextStyle.default_14,
          textAlign: textAlign ?? TextAlign.center,
          maxLines: maxLines,
          overflow: overflow ?? TextOverflow.ellipsis);

  static listViewText(String data,
          {TextStyle? style,
          int? maxLines,
          TextOverflow? overflow,
          TextAlign? textAlign,
          bool? isSubTitle}) =>
      Consumer<AppThemeProvider>(builder: (context, provider, _) {
        return Text(
          data,
          style: style != null
              ? style.copyWith(fontSize: AppTextStyle.h4.fontSize)
              : isSubTitle != null && style != null
                  ? style.copyWith(
                      fontSize:
                          provider.themeData.textTheme.bodyMedium!.fontSize! -
                              2,
                      color: AppColors.subText)
                  : isSubTitle != null
                      ? provider.themeData.textTheme.bodyMedium!.copyWith(
                          fontSize: provider
                                  .themeData.textTheme.bodyMedium!.fontSize! -
                              2,
                          color: AppColors.subText)
                      : provider.themeData.textTheme.bodyMedium,
          textAlign: textAlign ?? TextAlign.center,
          maxLines: maxLines,
          overflow: overflow ?? TextOverflow.ellipsis,
        );
      });
}
