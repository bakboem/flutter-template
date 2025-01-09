/*
 * Project Name:  [Tema1.0] - 
 * File: /Users/bakbeom/work/sm/si/SalesPortal/lib/enums/request_type.dart
 * Created Date: 2021-08-27 10:22:15
 * Last Modified: 2024-08-16 15:21:39
 * Author: bakbeom
 * Modified By: bakbeom
 * copyright @ 2022  SURGINUS(주). ALL RIGHTS RESERVED. 
 * ---  --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
 *                        Discription                         
 * ---  --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
 */

import 'dart:io';

import 'package:template/config/app_config.dart';
import 'package:template/services/deviceInfo_service.dart';

//*  api url / functionName/ resultTable 사전 정의.
enum RequestType { LOGIN }

extension RequestTypeExtension on RequestType {
  String get baseURL => AppBuildConfig.baseURL;

  bool get isDev => AppBuildConfig.appBuildType == 'dev';
  // api 에 header 추가 필요시 사전 등록.
  Future<Map<String, String>> get anotherHeader async {
    final deviceInfo = await DeviceInfoService.getDeviceInfo();
    final Map<String, String> tempHeader = {
      'devicePlatformNm': Platform.isIOS ? 'iOS Phone' : 'Android Phone',
      'osVerNm': deviceInfo.deviceVersion,
      'Timestamp': DateTime.now().toIso8601String(),
    };
    switch (this) {
      default:
        return tempHeader;
    }
  }
//*  url은 api 추가 할때 마다 지정 해줘야 함.
//*  default 값이 없다.

  String url({String? params}) {
    switch (this) {
      case RequestType.LOGIN:
        return '$baseURL/login';
    }
  }

// 메소드 사전 등록.
  String get httpMethod {
    switch (this) {
      default:
        return 'POST';
    }
  }

// Dio에서 api cancel시 사용 된는 구분자.
  String get tag {
    switch (this) {
      default:
        return 'tag_$runtimeType';
    }
  }

  String get contentsType {
    switch (this) {
      default:
        return '';
    }
  }

// 토큰을 사용하는 api 지정
// 토큰 사용 하는 api는 ApiService RequestWarper에서 Token을 자동 추가해준다.
  bool get isWithAccessToken {
    switch (this) {
      case RequestType.LOGIN:
        return false;
      default:
        return true;
    }
  }
}
