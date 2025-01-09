/*
 * Project Name:  [Tema]
 * File: /Users/bakbeom/work/sm/temaapp/lib/globalProvider/language_provider.dart
 * Created Date: 2024-04-26 16:28:27
 * Last Modified: 2024-08-12 11:16:27
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright ⓒ Surginus All rights reserved. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import 'dart:ui';

import 'package:flutter/widgets.dart';

class LanguageProvider extends ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  Future<void> setLocale(Locale l, {bool isNotUpdate = false}) async {
    _locale = l;
    if (!isNotUpdate) {
      notifyListeners();
    }
  }

  void init() {
    _locale = Locale(PlatformDispatcher.instance.locale.languageCode);
  }
}
