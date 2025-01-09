/*
 * Project Name:  [Tema]
 * File: /Users/bakbeom/work/sm/temaapp/lib/styles/app_route_page_animation.dart
 * Created Date: 2024-04-22 14:25:09
 * Last Modified: 2024-08-07 15:46:32
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright ⓒ Surginus All rights reserved. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import 'package:flutter/material.dart';

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  // Widget buildTransitions<T>(
  //     PageRoute<T> route,
  //     BuildContext context,
  //     Animation<double> animation,
  //     Animation<double> secondaryAnimation,
  //     Widget child) {
  //   // 创建一个滑动动画
  //   var begin = Offset(1.0, 0.0);
  //   var end = Offset.zero;
  //   var curve = Curves.fastOutSlowIn;
  //   var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //   var slideAnimation = animation.drive(tween);

  //   // 结合渐变动画
  //   return FadeTransition(
  //     opacity: animation,
  //     child: SlideTransition(
  //       position: slideAnimation,
  //       child: child,
  //     ),
  //   );
  // }
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn,
      )),
      child: child,
    );
  }
}
