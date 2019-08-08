import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:performance/common/dao/MarqueeDao.dart';
import 'package:performance/common/dao/UserInfoDao.dart';
import 'package:performance/common/model/MarqueeTableCell.dart';
import 'package:performance/common/model/UserInfo.dart';
import 'package:performance/common/style/MyStyle.dart';
import 'package:performance/common/utils/NavigatorUtils.dart';
import 'package:performance/widget/MyListState.dart';
import 'package:performance/widget/MyPullLoadWidget.dart';
import 'package:performance/widget/items/MarqeeListItem.dart';

///
///走馬燈列表頁
///Date: 2019-08-05
class MarqueeListPage extends StatefulWidget {
  @override
  _MarqueeListPageState createState() => _MarqueeListPageState();
}

class _MarqueeListPageState extends State<MarqueeListPage> with AutomaticKeepAliveClientMixin<MarqueeListPage>, MyListState<MarqueeListPage>{
  
  ///數據資料arr
  final List<dynamic> dataArray = [];
  ///還在排期日期中
  final List<dynamic> inDateTimeArray = [];
  ///超過排期日期
  final List<dynamic> outDateTimeArray = [];
  ///排期內已審核
  final List<dynamic> acceptOkArray_in = [];
  ///排期內未審核
  final List<dynamic> acceptNotArray_in = [];
  ///排期內下架
  final List<dynamic> acceptObArray_in = [];
  ///原始資料
  final List<dynamic> originInDateArr = [];
  final List<dynamic> originOutDateArr = [];
  ///userInfo model
  UserInfo userInfo;
  ///緩存最大字數
  var maxLegnth = 0;

  @override
  void initState() {
    super.initState();
    clearData();
    initParam();
  }

  @override
  void dispose() {
    super.dispose();
    clearData();
  }

  @override
  bool get isRefreshFirst => false;

  @override
  requestRefresh() async {
    return null;
  }

  @override
  requestLoadMore() async {
    return null;
  }

  ///覆寫自動縮放
  @override
  autoTextSize(text, style) {
   
    return AutoSizeText(
      text,
      style: style,
      minFontSize: 5.0,
      textAlign: TextAlign.center,
    );
  }

  //透過override pullcontroller裡面的handleRefresh覆寫數據
  @override
  Future<Null> handleRefresh() async {
    clearAllData();
    if (isLoading) {
      return null;
    }
    
    isLoading = true;
    await getOSDTastListAPI();

  }

  ///初始化資料
  void initParam() async {
    var userInfoData = await UserInfoDao.getUserInfoLocal();
    if (mounted) {
      setState(() {
        userInfo = userInfoData.data;
      });
    }
    getOSDTastListAPI();
    getMaxLengthAPI();
  }
  ///清除array緩存資料
  void clearAllData() {
    dataArray.clear();
    inDateTimeArray.clear();
    outDateTimeArray.clear();
    acceptNotArray_in.clear();
    acceptObArray_in.clear();
    acceptOkArray_in.clear();
    originInDateArr.clear();
    originOutDateArr.clear();
  }

  ///取得跑馬燈列表
  void getOSDTastListAPI() async {
    clearAllData();
    Map<String, dynamic> jsonMap = {};
    jsonMap["function"] = "getList";
    jsonMap["acceptStatus"] = "";
    jsonMap["type"] = "0";
    jsonMap["accNo"] = userInfo.accNo;
    jsonMap["accName"] = userInfo.accName;
    jsonMap["agencies"] = userInfo.deptName;

    var res = await MarqueeDao.getOSDTaskList(jsonMap);
    if (res != null && res.result) {
      this.dataArray.addAll(res.data);
    }
    if (this.dataArray.length > 0) {
      List<MarqueeTableCell> list = new List();
      var outDataArr = [];
      for (var dic in this.dataArray) {
        var eDate = dic["EndDate"];
        final dft = new DateFormat('yyyy-MM-dd HH:mm');
        var ed = dft.parse(eDate);
        var today = new DateTime.now();
        var todayStr = dft.format(today);
        var td = dft.parse(todayStr);
        
        if (ed.isAfter(td)) {
          this.inDateTimeArray.add(dic);
        }
        else {
          outDataArr.add(dic);
        }
        list.add(MarqueeTableCell.fromJson(dic));
      }
      for (var dic in this.inDateTimeArray) {
        if (dic["AcceptStatus"] == "0") {
          this.acceptNotArray_in.add(dic);
        }
        else if (dic["AcceptStatus"] == "1") {
          this.acceptOkArray_in.add(dic);
        }
        else {
          this.acceptObArray_in.add(dic);
        }
      }
      this.outDateTimeArray.addAll(outDataArr);
      this.originOutDateArr.add(this.outDateTimeArray);
      this.originInDateArr.add(this.inDateTimeArray);
      if (mounted) {
        setState(() {
          isLoading = false;
          pullLoadWidgetControl.dataList.clear();
          pullLoadWidgetControl.dataList.addAll(list);
          pullLoadWidgetControl.needLoadMore = false;
        });
      }
    }
  }

  ///取得最大字數
  void getMaxLengthAPI() async {
    Map<String, dynamic> jsonMap = {};
    jsonMap["function"] = "getMaxMessageLength";
    jsonMap["accNo"] = userInfo.accNo;
    var res = await MarqueeDao.getMaxLength(jsonMap);
    if (res != null && res.result) {
      if (mounted) {
        setState(() {
          this.maxLegnth = res.data;
        });
      }
    }
  }

  /// app bar action
  List<Widget> actions() {
    List<Widget> list = [
      Expanded(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  child: autoTextSize('新北全區', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
                ),
              ),
            ),
            Flexible(
              child: Container(
                alignment: Alignment.center,
                height: 30,
                child: autoTextSize('走馬燈', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
              ),
            ),
            Flexible(
              child: Container(),
            )
          ],
        ),
      )
    ];
    return list;
  }

  ///列表顯示物件
  _renderItem(index) {
    MarqueeTableCell mtc = pullLoadWidgetControl.dataList[index];
    MarqueeListModel model = MarqueeListModel.forMap(mtc);
    return MarqueeListItem(model: model,);
    
  }

  ///產生body列表
  _renderBody() {
    return MyPullLoadWidget(
        pullLoadWidgetControl,
        (BuildContext context, int index) => _renderItem(index),
        handleRefresh,
        onLoadMore,
        refreshKey: refreshIndicatorKey,
    );
  }
   ///產生body列表
  _renderBody2() {
    return MyPullLoadWidget(
        pullLoadWidgetControl,
        (BuildContext context, int index) => _renderItem(index),
        handleRefresh,
        onLoadMore,
        refreshKey: refreshIndicatorKey2,
    );
  }
  ///列表header
  _renderHeader(index) {
    var bgColors;
    if (index == 0) {
      bgColors =  MyColors.hexFromStr('fdeadb');
    }
    else {
      bgColors =  MyColors.hexFromStr('f5ffef');
    }
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(color: Color(bgColors),border: Border(bottom: BorderSide(color: Colors.black, width: 1.0, style: BorderStyle.solid))),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              alignment: Alignment.center,
              child: autoTextSize('區域', TextStyle(color: Colors.black)),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: autoTextSize('需求/發送單位', TextStyle(color: Colors.black)),
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.center,
              child: autoTextSize('時間日期', TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }

  ///Scaffold body widget
  Widget bodyView() {
    Widget body;
    body = isLoading ? showLoadingAnime(context) : Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _renderHeader(0),
          Expanded(
            child: _renderBody(),
          ),
          _renderHeader(1),
          Expanded(
            // child: Container(color: Colors.yellow,),
            child: _renderBody2(),
          )
        ],
      ),  
    );
    return body;
  }

  ///Scaffold bottomBar widget
  Widget bottomBar() {
    Widget bottom = Material(
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          Flexible(
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 42,
                child: autoTextSize('刷新', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
              ),
              onTap: () {
                showRefreshLoading();
              },
            ),
          ),
          Flexible(
            child:  GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 42,
                child: autoTextSize('新增', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
              ),
              onTap: (){
                
              },
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              height: 30,
              child: FlatButton.icon(
                icon: Image.asset('static/images/24.png'),
                color: Colors.transparent,
                label: Text(''),
                onPressed: (){
                  NavigatorUtils.goLogin(context);
                },
              ),
            ),
          ),
          Flexible(
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 42,
                child: autoTextSize('', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
              ),
              onTap: (){

              },
            ),
          ),
          Flexible(
            child:  GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 42,
                child: autoTextSize('返回', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),          
        ],
      ),
    );
    return bottom;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            leading: Container(),
            elevation: 0.0,
            actions: actions(),
          ),
          preferredSize: Size.fromHeight(40.0),
        ),
        
        body: bodyView(),
        bottomNavigationBar: bottomBar()
      ),
    );
  }
}