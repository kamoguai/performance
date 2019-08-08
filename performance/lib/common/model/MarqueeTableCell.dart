import 'package:json_annotation/json_annotation.dart';

part 'MarqueeTableCell.g.dart';

@JsonSerializable()
///
///走馬燈列表model
///Date: 2019-08-08
class MarqueeTableCell {
  String requireSources;
  String fontColor;
  String modifyUser;
  String acceptUserName;
  int intervalSec;
  String oSDMemo;
  String isDelete;
  String createDate;
  String backgroundColor;
  int oTNO;
  String modifyDate;
  String acceptUser;
  String acceptStatus;
  String schTime;
  String createUser;
  String areaCode;
  String createUserName;
  String oSDContent;
  String endDate;
  String startDate;
  String agencies;
  String acceptDate;
  String areaName;
  String modifyUserName;

  MarqueeTableCell(
    this.requireSources,
    this.fontColor,
    this.modifyUser,
    this.acceptUserName,
    this.intervalSec,
    this.oSDMemo,
    this.isDelete,
    this.createDate,
    this.backgroundColor,
    this.oTNO,
    this.modifyDate,
    this.acceptUser,
    this.acceptStatus,
    this.schTime,
    this.createUser,
    this.areaCode,
    this.createUserName,
    this.oSDContent,
    this.endDate,
    this.startDate,
    this.agencies,
    this.acceptDate,
    this.areaName,
    this.modifyUserName,
  );

   // 反序列化
   factory MarqueeTableCell.fromJson(Map<String, dynamic> json) => _$MarqueeTableCellFromJson(json);
   // 序列化
   Map<String, dynamic> toJson() => _$MarqueeTableCellToJson(this);

   // 命名構造函數
   MarqueeTableCell.empty();
}