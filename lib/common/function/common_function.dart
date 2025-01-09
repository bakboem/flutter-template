import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

pr(dynamic str) {
  if (kDebugMode) {
    print('\n############ LOG #############\n'
        '$str'
        '\n'
        '############ END ############# \n');
  }
}

void popToFirst(BuildContext context) {
  Navigator.of(context).popUntil((route) => route.isFirst);
}
