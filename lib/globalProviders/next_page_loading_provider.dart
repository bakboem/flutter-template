/*
 * Project Name:  [Tema1.0] - 
 * File: /Users/bakbeom/work/sm/si/salesportal/lib/view/common/provider/next_page_loading_provider.dart
 * Created Date: 2022-01-24 23:04:07
 * Last Modified: 2024-03-18 11:19:30
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright @ 2022  SURGINUS(주). ALL RIGHTS RESERVED. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import 'package:flutter/material.dart';

class NextPageLoadingProvider extends ChangeNotifier {
  bool isShowLoading = false;
  void show() {
    isShowLoading = true;
    notifyListeners();
  }

  void stop() {
    isShowLoading = false;
    notifyListeners();
  }
}
