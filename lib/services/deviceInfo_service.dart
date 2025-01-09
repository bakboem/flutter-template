/*
 * Project Name:  [Tema1.0] - 
 * File: /Users/bakbeom/work/sm/si/SalesPortal/lib/service/deviceInfo_service.dart
 * Created Date: 2021-08-16 21:01:02
 * Last Modified: 2024-03-25 22:44:00
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright @ 2022  SURGINUS(주). ALL RIGHTS RESERVED. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import 'dart:io';
import 'package:template/models/user/device_info.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  factory DeviceInfoService() => _sharedInstance();
  static DeviceInfoService? _instance;
  DeviceInfoService._();
  static DeviceInfoService _sharedInstance() {
    _instance ??= DeviceInfoService._();
    return _instance!;
  }

  static Future<Map<String, dynamic>> getDeviceScreenInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    return Platform.isAndroid
        ? deviceInfo.deviceInfo.then((value) => value.data)
        : deviceInfo.iosInfo.then((value) => value.data);
  }

  static Future<CostomDeviceInfo> getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();

    AndroidDeviceInfo androidInfo;
    IosDeviceInfo iosDeviceInfo;
    CostomDeviceInfo? userDeviceInfo;
    if (Platform.isIOS) {
      iosDeviceInfo = await deviceInfo.iosInfo;
      userDeviceInfo = CostomDeviceInfo(
          '${iosDeviceInfo.identifierForVendor}',
          'apple',
          iosDeviceInfo.utsname.nodename,
          iosDeviceInfo.utsname.machine,
          iosDeviceInfo.systemVersion);
    }
    if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
      String? deviceId = androidInfo.serialNumber;
      userDeviceInfo = CostomDeviceInfo(
          deviceId,
          androidInfo.brand,
          androidInfo.device,
          androidInfo.model,
          '${androidInfo.version.sdkInt}');
    }

    return userDeviceInfo!;
  }
}
