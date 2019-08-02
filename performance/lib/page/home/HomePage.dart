import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:performance/common/style/MyStyle.dart';
import 'package:performance/page/home/FirstPage.dart';
import 'package:performance/page/home/SecondPage.dart';
import 'package:performance/page/home/ThirdPage.dart';
import 'package:performance/widget/MyCalendarWidget.dart';
import 'package:performance/widget/MyListState.dart';

///
///首頁
///Date: 2019-07-24
class HomePage extends StatefulWidget {
  static final String sName = "home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage>, MyListState<HomePage>{

  var nowPage = 0;

  List<Widget> pageWigetList = [
    FirstPage(),
    SecondPage(),
    ThirdPage()
  ];

  PageController pgController = new PageController(initialPage: 0);

  @override
    void initState() {
      super.initState();
      pgController.addListener((){
        switch (pgController.page.round()) {
          case 0:
            setState(() {
              this.nowPage = 0;
            });
            Fluttertoast.showToast(msg: "第一頁");
            break;
          case 1:
            setState(() {
              this.nowPage = 1;
            });
            Fluttertoast.showToast(msg: "第二頁");
            break;
          case 2:
            setState(() {              
              this.nowPage = 2;
            });
            Fluttertoast.showToast(msg: "第三頁");
            break;
          default:
            break;
        }
      });    
      
      clearData();
      // initParam();
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

  Widget bodyView() {
      Widget body;
      body = Container(
        child: PageView(
          controller: pgController,
          children: pageWigetList.map((index) => buildPageItem(pageWigetList.indexOf(index))).toList(),
        ),
      );
      return body;
  }

  ///bottomNavigationBar 按鈕
  Widget bottomBar() {
    List<Widget> list = [];
    
    list.add(
      GestureDetector(
        child: Container(
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.center,
          height: 42,
          width: deviceWidth6(),
          child: autoTextSize('刷新', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
        ),
        onTap: () {
          showRefreshLoading();
        },
      ),
    );
    if (this.nowPage == 0) {
      list.add(
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.center,
            height: 42,
            width: deviceWidth6(),
            child: autoTextSize('業績', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
          ),
          onTap: () {
            showRefreshLoading();
          },
        ),
      );
    }
    else {
      list.add(
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.center,
            height: 42,
            width: deviceWidth6(),
            child: autoTextSize('', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
          ),
          onTap: () {
            
          },
        ),
      );
    }
    
    list.add(
    Container(
        alignment: Alignment.center,
        height: 30,
        // width: deviceWidth3(context),
        child: FlatButton.icon(
          icon: Image.asset('static/images/24.png'),
          color: Colors.transparent,
          label: Text(''),
          onPressed: (){
            // NavigatorUtils.goLogin(context);
          },
        ),
      ),
    );
    list.add(
      GestureDetector(
        child: Container(
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.center,
          height: 42,
          width: deviceWidth6(),
          child: autoTextSize('今日', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
        ),
        onTap: () {
          
        },
      ),
    );
    list.add(
      GestureDetector(
        child: Container(
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.center,
          height: 42,
          width: deviceWidth6(),
          child: autoTextSize('返回', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
        ),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
    Widget bottom = Material(
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: list
      ),
    );
    return bottom;
  }

  Widget buildPageItem(index) {
    return pageWigetList[index];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
        ),
        body: bodyView(),
        bottomNavigationBar: bottomBar(),
      ),
    );
  }
}