/*
 * Project Name:  [mKolon3.0] - MedicalSalesPortal
 * File: /Users/bakbeom/work/sm/si/medsalesportal/lib/service/key_service.dart
 * Created Date: 2022-07-02 14:53:52
 * Last Modified: 2024-09-05 17:43:57
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright @ 2022  SURGINUS(주). ALL RIGHTS RESERVED. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import 'package:flutter/widgets.dart';

class KeyService {
  factory KeyService() => _sharedInstance();
  static KeyService? _instance;
  KeyService._();
  static KeyService _sharedInstance() {
    _instance ??= KeyService._();
    return _instance!;
  }

  static final GlobalKey boundaryKey = GlobalKey();
  static final GlobalKey<NavigatorState> baseAppKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> activityPageKey =
      GlobalKey<NavigatorState>();
  static GlobalKey screenKey = GlobalKey();
}
