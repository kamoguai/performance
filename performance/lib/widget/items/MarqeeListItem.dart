
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:performance/common/model/MarqueeTableCell.dart';
import 'package:performance/common/style/MyStyle.dart';
import 'package:performance/widget/BaseWidget.dart';

///
///走馬燈列表item
///Date: 2019-08-08
class MarqueeListItem extends StatelessWidget with BaseWidget{
  ///set, get
  final MarqueeListModel model;
  MarqueeListItem({this.model});

  @override
  Widget build(BuildContext context) {
    final dft = new DateFormat('yy-MM-dd HH:mm');
    var sDate = dft.parse(model.startDate);
    var eDate = dft.parse(model.endDate);
    var sd = dft.format(sDate);
    var ed = dft.format(eDate);
    final deviceHeight = MediaQuery.of(context).size.height;
    var rowHeight;
    if (deviceHeight < 600) {
      rowHeight = 25.0;
    }
    else {
      rowHeight = null;
    }
    return Container(
      height: 80,
      // padding: EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey, style: BorderStyle.solid))),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: autoTextSize('${model.areaName}', TextStyle(color: Colors.black), context),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: autoTextSize('${model.requireSources}', TextStyle(color: Colors.black), context),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: autoTextSize('${model.agencies}', TextStyle(color: Colors.black), context),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: rowHeight,
                          alignment: Alignment.center,
                          child: autoTextSize('$sd', TextStyle(color: Colors.blue), context),
                        ),
                        Container(
                          height: rowHeight,
                          alignment: Alignment.center,
                          child: autoTextSize('$ed', TextStyle(color: Colors.red), context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(color: Color(MyColors.hexFromStr('f3fdff')),border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey, style: BorderStyle.solid))),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: autoTextSize('說明：', TextStyle(color: Colors.black), context),
                    ),
                    
                  ),
                  Flexible(
                    flex: 4,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: autoTextSize('${model.oSDMemo}', TextStyle(color: Colors.black), context),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class MarqueeListModel {
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
  MarqueeListModel();

  MarqueeListModel.forMap(MarqueeTableCell data) {
    requireSources = data.requireSources == null ? "" : data.requireSources;
    fontColor = data.fontColor == null ? "" : data.fontColor;
    modifyUser = data.modifyDate == null ? "" : data.modifyDate;
    acceptUserName = data.acceptUserName == null ? "" : data.acceptUserName;
    intervalSec = data.intervalSec == null ? 0 : data.intervalSec;
    oSDMemo = data.oSDMemo == null ? "" : data.oSDMemo;
    isDelete = data.isDelete == null ? "" : data.isDelete;
    createDate = data.createDate == null ? "" : data.createDate;
    backgroundColor = data.backgroundColor == null ? "" : data.backgroundColor;
    oTNO = data.oTNO == null ? 0 : data.oTNO;
    modifyDate = data.modifyDate == null ? "" : data.modifyDate;
    acceptUser = data.acceptUser == null ? "" : data.acceptUser;
    acceptStatus = data.acceptStatus == null ? "" : data.acceptStatus;
    schTime = data.schTime == null ? "" : data.schTime;
    createUser = data.createUser == null ? "" : data.createUser;
    areaCode = data.areaCode == null ? "" : data.areaCode;
    createUserName = data.createUserName == null ? "" : data.createUserName;
    oSDContent = data.oSDContent == null ? "" : data.oSDContent;
    endDate = data.endDate == null ? "" : data.endDate;
    startDate = data.startDate == null ? "" : data.startDate;
    agencies = data.agencies == null ? "" : data.agencies;
    acceptDate = data.acceptDate == null ? "" : data.acceptDate;
    areaName = data.areaName == null ? "" : data.areaName;
    modifyUserName = data.modifyUserName == null ? "" : data.modifyUserName;
  }

}