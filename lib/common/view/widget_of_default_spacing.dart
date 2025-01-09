/*
 * Project Name:  [mKolon3.0] - MedicalSalesPortal
 * File: /Users/bakbeom/work/sm/si/medsalesportal/lib/view/common/widget_of_default_spacing.dart
 * Created Date: 2022-07-03 14:18:03
 * Last Modified: 2024-03-18 11:18:58
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright @ 2022  SURGINUS(주). ALL RIGHTS RESERVED. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import 'package:flutter/material.dart';

import '../../styles/export_common.dart';

Widget defaultSpacing({double? height, int? times, bool? isHalf}) => Padding(
    padding: EdgeInsets.only(
        top: height ??
            (times != null
                ? AppSize.defaultListItemSpacing * times
                : isHalf != null && isHalf
                    ? AppSize.defaultListItemSpacing / 2
                    : AppSize.defaultListItemSpacing)));
