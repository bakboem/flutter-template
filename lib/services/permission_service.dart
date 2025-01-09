/*
 * Project Name:  [Tema1.0] - 
 * File: /Users/bakbeom/work/sm/si/SalesPortal/lib/service/permission_service.dart
 * Created Date: 2021-08-13 11:38:37
 * Last Modified: 2024-06-15 12:33:38
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright @ 2022  SURGINUS(주). ALL RIGHTS RESERVED. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import 'dart:io';
import 'package:template/common/function/common_function.dart';
import 'package:location/location.dart' as location;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

class PermissionService {
  static var getCameraAndPhotoLibrayPermisson = [
    Permission.camera,
    Permission.mediaLibrary
  ];
  static var getLocationPermisson = [
    Permission.location,
  ];
  static var getIosBlePermission = [Permission.bluetooth];
  static var getAndroidBlePermission = [
    Permission.bluetoothConnect,
    Permission.bluetoothScan,
  ];

  // 포토 & 라이브러리 권한 부여상태 체크 및 요청.

  // 포토 & 라이브러리 권한 부여상태 체크 및 요청.
  static Future<bool> checkBlePermisson() async {
    List<bool> canUse = [];
    await Future.forEach(
        Platform.isAndroid ? getAndroidBlePermission : getIosBlePermission,
        (permission) async {
      // 권한 필요시 요청.
      await requestPermission(permission).then((value) => canUse.add(value));
    });

    return !canUse.contains(false);
  }

  static Future<void> checkDawerAndBettary() async {
    if (!Platform.isAndroid) return;
    if (!await FlutterForegroundTask.canDrawOverlays) {
      // This function requires `android.permission.SYSTEM_ALERT_WINDOW` permission.
      await FlutterForegroundTask.openSystemAlertWindowSettings();
    }

    if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
      // This function requires `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` permission.
      await FlutterForegroundTask.requestIgnoreBatteryOptimization();
    }
  }

  // 권한 요청.
  static Future<bool> requestPermission(Permission permission) async {
    return await permission.request().isGranted;
  }

  static Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      return await Permission.storage.request().isGranted;
    } else {
      return true;
    }
  }

  static Future<void> checkNotifacationPermission() async {
    final NotificationPermission notificationPermissionStatus =
        await FlutterForegroundTask.checkNotificationPermission();
    if (notificationPermissionStatus != NotificationPermission.granted) {
      await FlutterForegroundTask.requestNotificationPermission();
    }

    // Android 13 and higher, you need to allow notification permission to expose foreground service notification.
  }

  static Future<bool> requestLocationPermission() async {
    final lc = location.Location();
    var serviceEnabled = false;
    location.PermissionStatus permissionGranted;
    serviceEnabled = await lc.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await lc.requestService();
    }
    pr('localtion???????$serviceEnabled');

    permissionGranted = await lc.hasPermission();
    if (permissionGranted == location.PermissionStatus.denied) {
      permissionGranted = await lc.requestPermission();
    }
    return permissionGranted == location.PermissionStatus.granted;
  }

  //  권한 상태 체크.
  static Future<bool> checkPermissionStatus(Permission permission) async {
    return await permission.status.isGranted;
  }
}
