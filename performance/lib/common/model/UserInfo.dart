import 'package:json_annotation/json_annotation.dart';

part 'UserInfo.g.dart';
///
///使用者信息model
///Date: 2019-06-04
///
@JsonSerializable()
class UserInfo {
  bool isCityPerformance;
  bool isOSDUser;
  bool isOSDExaminer;
  String accNo;
  String accName;
  String deptName;
  UserInfo(
    this.isCityPerformance,
    this.isOSDExaminer,
    this.isOSDUser,
    this.accName,
    this.accNo,
    this.deptName
  );

   // 反序列化
   factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
   // 序列化
   Map<String, dynamic> toJson() => _$UserInfoToJson(this);

   // 命名構造函數
   UserInfo.empty();
}
