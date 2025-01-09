/*
 * Project Name:  [Tema1.0] - 
 * File: /Users/bakbeom/work/sm/si/SalesPortal/lib/view/common/provider/app_theme_provider.dart
 * Created Date: 2021-09-01 20:12:58
 * Last Modified: 2024-04-26 15:52:18
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright @ 2022  SURGINUS(주). ALL RIGHTS RESERVED. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import 'package:template/enums/app_theme_type.dart';
import 'package:template/styles/app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeProvider with ChangeNotifier {
  AppThemeType themeType = AppThemeType.TEXT_MEDIUM;
  ThemeData themeData = Apptheme().appTheme;

  void setThemeType(AppThemeType type) {
    themeType = type;
    themeData = themeType.theme;
    notifyListeners();
  }
}
