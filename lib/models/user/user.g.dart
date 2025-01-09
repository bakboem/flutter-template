// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'],
      json['userAccount'] as String?,
      json['password'] as String?,
      json['email'] as String?,
      json['mobileNum'] as String?,
      json['snsAccount'] as String?,
      json['snsType'] as String?,
      json['createDt'] == null
          ? null
          : DateTime.parse(json['createDt'] as String),
      tokenInfo: json['tokenInfo'] == null
          ? null
          : TokenModel.fromJson(json['tokenInfo']),
    )..useMarketing = json['useMarketing'] == null
        ? null
        : DateTime.parse(json['useMarketing'] as String);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'userAccount': instance.userAccount,
      'password': instance.password,
      'email': instance.email,
      'snsAccount': instance.snsAccount,
      'snsType': instance.snsType,
      'mobileNum': instance.mobileNum,
      'createDt': instance.createDt?.toIso8601String(),
      'useMarketing': instance.useMarketing?.toIso8601String(),
      'tokenInfo': instance.tokenInfo?.toJson(),
    };
