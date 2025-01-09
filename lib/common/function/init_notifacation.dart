import 'dart:async';

import 'package:template/config/app_config.dart';
import 'package:template/models/recive_noti.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'common_function.dart';

Future<void> initAndroidNotification() async {
  final plugin = FlutterLocalNotificationsPlugin();
  const channel = AndroidNotificationChannel(
    AppBuildConfig.nativeChannelID, // id
    '체온 알림', // title
    description: '실시간 체온 알림 보내드립니다.', // description
    importance: Importance.high, // importance must be at low or higher level
  );
  const notiChannel = AndroidNotificationChannel(
    AppBuildConfig.notiTasckID, // 使用新的通道ID
    '체온 알림',
    description: '실시간 체온 알림 보내드립니다.',
    importance: Importance.high, // 设置重要性为高，以允许在屏幕顶部显示
  );
  await plugin.initialize(
    InitializationSettings(
      android: AndroidInitializationSettings('ic_launcher'),
    ),
    onDidReceiveNotificationResponse: onDidReceiveLocalNotification,
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );

  await plugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await plugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(notiChannel);
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  pr('background::: $notificationResponse');
}

void onDidReceiveLocalNotification(NotificationResponse response) async {
  // display a dialog with the notification details, tap ok to go to another page
  pr("onDidReceiveLocalNotification body!!! ${response.id}");
  pr("onDidReceiveLocalNotification payload!!! ${response.payload}");
  pr("onDidReceiveLocalNotification input!!! ${response.input}");
}

Future<void> initIosNotification() async {
  final plugin = FlutterLocalNotificationsPlugin();
  final didReceiveLocalNotificationStream =
      StreamController<ReceivedNotification>.broadcast();

  final DarwinInitializationSettings initializationSettingsDarwin;
  await plugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
  final darwinNotificationCategories = <DarwinNotificationCategory>[
    DarwinNotificationCategory(
      AppBuildConfig.nativeChannelID,
      actions: [
        DarwinNotificationAction.text(
          AppBuildConfig.nativeChannelID,
          'Tempreature',
          buttonTitle: 'Send',
          placeholder: 'Placeholder',
        ),
      ],
    ),
  ];

  /// Note: permissions aren't requested here just to demonstrate that can be
  /// done later
  initializationSettingsDarwin = DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
    notificationCategories: darwinNotificationCategories,
  );
  final initializationSettings =
      InitializationSettings(iOS: initializationSettingsDarwin);
  await plugin.initialize(initializationSettings);
  didReceiveLocalNotificationStream.stream.listen((event) {
    pr('${event.body} ${event.payload} ${event.title}  ${event.id}');
  });
}

Future<void> showNotification(
    {required String body,
    required String title,
    required bool isWithSound}) async {
  final plugin = FlutterLocalNotificationsPlugin();
  var notificationDetails = NotificationDetails(
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: isWithSound,
      ),
      android: AndroidNotificationDetails(
        AppBuildConfig.notiChennalID,
        'Surginus Channel',
        icon: 'ic_bg_service_small',
        ongoing: true,
      ));
  await plugin.show(
    AppBuildConfig.alarmChannelID,
    title,
    body,
    notificationDetails,
  );
}

Future<void> scheduleNotification() async {}

Future<void> startAlarmNoti(alarm) async {
  await stopAlarmNoti(alarm);
  pr('start notification id ${alarm.id!} ');
}

Future<void> stopAlarmNoti(alarm) async {
  await FlutterLocalNotificationsPlugin().cancel(int.parse(alarm.id!));
  pr('canceld notification id ${alarm.id!} ');
}
