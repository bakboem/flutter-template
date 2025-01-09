import 'package:json_annotation/json_annotation.dart';
part 'device_info.g.dart';

@JsonSerializable()
class CostomDeviceInfo {
  String deviceId;
  String deviceBrand;
  String deviceName;
  String deviceModel;
  String deviceVersion;
  CostomDeviceInfo(this.deviceId, this.deviceBrand, this.deviceName,
      this.deviceModel, this.deviceVersion);

  factory CostomDeviceInfo.fromJson(Object? json) =>
      _$CostomDeviceInfoFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CostomDeviceInfoToJson(this);
}
