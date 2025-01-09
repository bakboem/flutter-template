// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CostomDeviceInfo _$CostomDeviceInfoFromJson(Map<String, dynamic> json) =>
    CostomDeviceInfo(
      json['deviceId'] as String,
      json['deviceBrand'] as String,
      json['deviceName'] as String,
      json['deviceModel'] as String,
      json['deviceVersion'] as String,
    );

Map<String, dynamic> _$CostomDeviceInfoToJson(CostomDeviceInfo instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'deviceBrand': instance.deviceBrand,
      'deviceName': instance.deviceName,
      'deviceModel': instance.deviceModel,
      'deviceVersion': instance.deviceVersion,
    };
