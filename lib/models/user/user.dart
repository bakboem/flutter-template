import 'package:template/models/user/token_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  dynamic id;
  String? userAccount;
  String? password;
  String? email;
  String? snsAccount;
  String? snsType;
  String? mobileNum;
  DateTime? createDt;
  DateTime? useMarketing;
  TokenModel? tokenInfo;

  User(this.id, this.userAccount, this.password, this.email, this.mobileNum,
      this.snsAccount, this.snsType, this.createDt,
      {this.tokenInfo});
  factory User.fromJson(Object? json) =>
      _$UserFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
