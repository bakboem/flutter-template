/*
 * Project Name:  [Tema1.0] - 
 * File: /Users/bakbeom/work/sm/si/SalesPortal/lib/util/log_util.dart
 * Created Date: 2021-08-21 17:08:35
 * Last Modified: 2024-03-19 10:02:39
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright @ 2022  SURGINUS(주). ALL RIGHTS RESERVED. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import 'package:logger/logger.dart';

class CustomPrinter extends LogPrinter {
  final LogPrinter _realPrinter;
  late Map<Level, String> _prefixMap;

  CustomPrinter(
    this._realPrinter, {
    debug,
    info,
    warning,
    error,
  }) : super() {
    _prefixMap = {
      Level.debug: debug ?? 'DEBUG',
      Level.info: info ?? 'INFO',
      Level.warning: warning ?? 'WARNING',
      Level.error: error ?? 'ERROR',
    };
  }

  @override
  List<String> log(LogEvent event) {
    return _realPrinter
        .log(event)
        .map((s) => '${_prefixMap[event.level]}$s')
        .toList();
  }
}

final customLogger = Logger(
  printer: CustomPrinter(
    PrettyPrinter(
      colors: false,
    ),
  ),
);
