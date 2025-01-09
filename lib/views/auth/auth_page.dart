import 'dart:io';
import 'dart:math';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:template/common/function/common_function.dart';
import 'package:template/common/view/base_app_dialog.dart';
import 'package:template/services/permission_service.dart';
import 'package:template/styles/export_common.dart';
import 'package:template/views/home/home_page.dart';
import 'package:template/views/login/login_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    // _initForgroundService();
  }

  void _initForgroundService() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _requestPermissionForAndroid();
    });
  }

  Future<void> _requestPermissionForAndroid() async {
    if (!Platform.isAndroid) return;
    if (await FlutterForegroundTask.canDrawOverlays &&
        await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
      return;
    }

    await AppDialog.showPopup(context,
        title: '',
        body: tr('permission_discription'),
        isSingleButton: true,
        isCanPop: false, successCallback: () async {
      popToFirst(context);
      await PermissionService.checkDawerAndBettary();
    });
    await PermissionService.checkNotifacationPermission();
  }

  @override
  Widget build(BuildContext context) {
    var isLogedin = Random().nextBool();
    FlutterNativeSplash.remove();
    FlutterBackgroundService().startService();
    return Scaffold(
      backgroundColor: AppColors.whiteText,
      body: Stack(
        children: [isLogedin ? HomePage() : LoginPage()],
      ),
    );
  }
}
