/*
 * Project Name:  [mKolon3.0] - MedicalSalesPortal
 * File: /Users/bakbeom/work/sm/si/medsalesportal/lib/route.dart
 * Created Date: 2022-07-02 14:47:58
 * Last Modified: 2024-08-07 14:34:07
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright @ 2022  KOLON GROUP. ALL RIGHTS RESERVED. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import 'package:template/views/signin/signin_page.dart';
import 'package:flutter/widgets.dart';

Map<String, WidgetBuilder> routes = {
  SigninPage.routeName: (context) => const SigninPage(),
};
