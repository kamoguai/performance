// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
    json['isCityPerformance'] as bool,
    json['isOSDExaminer'] as bool,
    json['isOSDUser'] as bool,
    json['accName'] as String,
    json['accNo'] as String,
    json['deptName'] as String,
  );
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'isCityPerformance': instance.isCityPerformance,
      'isOSDUser': instance.isOSDUser,
      'isOSDExaminer': instance.isOSDExaminer,
      'accNo': instance.accNo,
      'accName': instance.accName,
      'deptName': instance.deptName,
    };
