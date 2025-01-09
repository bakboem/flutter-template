// ignore_for_file: dead_code, unused_local_variable

/*
 * Project Name:  [Tema]
 * File: /Users/bakbeom/work/sm/temaapp/lib/init_background.dart
 * Created Date: 2024-04-23 12:26:34
 * Last Modified: 2024-10-08 14:36:04
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright ⓒ Surginus All rights reserved. 
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 * 												Discription													
 * ---	---	---	---	---	---	---	---	---	---	---	---	---	---	---	---
 */

import "dart:io";
import "dart:ui";
import "dart:async";
import "package:template/common/function/common_function.dart";
import "package:template/common/function/init_notifacation.dart";
import "package:template/config/app_config.dart";
import "package:template/services/cache_service.dart";
import "package:template/services/hive_service.dart";
import "package:flutter/material.dart";
import "package:flutter_background_service/flutter_background_service.dart";

typedef NotiCycleSwichCallback = void Function(bool data);

Future<void> initializeBackgroundService() async {
  final service = FlutterBackgroundService();
  if (Platform.isAndroid) await initAndroidNotification();
  if (Platform.isIOS) await initIosNotification();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: false,
      notificationChannelId: AppBuildConfig.notiChennalID,
      initialNotificationTitle: "",
      initialNotificationContent: "",
      foregroundServiceNotificationId: 54321,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

@pragma("vm:entry-point")
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma("vm:entry-point")
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  await HiveService.init();
  await CacheService.reload();
  // var backgroundParam = CacheService.getBackgroundParam();
  // var backgroundParam = CacheService.getBackgroundParam();
  // final lastData = await HiveService.getLastBeaconData();

  pr('restart scanner done.');

  if (service is AndroidServiceInstance) {
    service.on("setAsForeground").listen((event) {
      service.setAsForegroundService();
    });
    service.on("setAsBackground").listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on("stopService").listen(
    (event) async {
      await service.stopSelf();
      await CacheService.reload();
      pr('stopService done.');
    },
  );
}

void restartService() async {
  await CacheService.reload();
  final service = FlutterBackgroundService();
  var isRunning = await service.isRunning();
  if (isRunning) {
    pr("Stopping service...");
    await stopService();
    await Future.delayed(Duration(seconds: 1));
    if (!await service.isRunning()) {
      pr("Starting service...");
      await service.startService();
      if (Platform.isAndroid) {
        service.invoke("setAsForeground");
      }
      pr("Service restarted with new parameters.");
    }
  } else {
    pr("Starting service...");
    await service.startService();
    if (Platform.isAndroid) {
      service.invoke("setAsForeground");
    }
    pr("Service restarted with new parameters.");
  }
}

Future<void> stopService() async {
  FlutterBackgroundService().invoke("stopService");
}

Future<void> updateGlobalState({bool isFromHome = false}) async {
  if (!isFromHome) {
    await HiveService.closeAllBoxes();
  }
  restartService();
}
