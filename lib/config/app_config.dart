import 'package:template/enums/languge_type.dart';
import 'package:flutter/material.dart';

class AppBuildConfig {
  static const baseURL = '';
  static const notiChennalID = 'noti_channel';
  static const notiTasckID = 'noti_new_channel';
  static const alarmChannelID = 555;
  static const appBuildType = 'dev';
  static const nativeChannelID = 'com.codera.template/channel';
  static List<Locale> get appLocale =>
      [...LanguageType.values.map((type) => type.locale)];
}
