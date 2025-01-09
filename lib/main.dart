// ignore_for_file: avoid_pr

import 'dart:ui';
import 'package:template/common/function/overlay_function.dart';
import 'package:template/config/app_config.dart';
import 'package:template/init_background.dart';
import 'package:template/live_app.dart';
import 'package:template/services/cache_service.dart';
import 'package:template/services/hive_service.dart';
import 'package:template/services/permission_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  var binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  FlutterForegroundTask.initCommunicationPort();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheService.init();
  await HiveService.init();
  await initializeBackgroundService();
  await PermissionService.requestStoragePermission();
  setSystemOverlayLight();
  start();
}

void start() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (_) {
      runApp(
        EasyLocalization(
          supportedLocales: AppBuildConfig.appLocale,
          path: "assets/location",
          fallbackLocale: const Locale("en"),
          startLocale: Locale(PlatformDispatcher.instance.locale.languageCode),
          child: const LiveApp(),
        ),
      );
    },
  );
}
