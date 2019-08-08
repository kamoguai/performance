import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:performance/common/style/MyStyle.dart';
import 'package:performance/common/utils/NavigatorUtils.dart';
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
              print("第一頁");
            });
            
            break;
          case 1:
            setState(() {
              this.nowPage = 1;
              print("第二頁");
            });
            break;
          case 2:
            setState(() {              
              this.nowPage = 2;
              print("第三頁");
            });
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

  ///Scaffold appbar actions
  List<Widget> actions() {
    ///裝載action內容
    List<Widget> action = [];
    ///裝載row children內容
    List<Widget> list = [];
    list.add(
      Flexible(
        flex: 2,
        child: InkWell(
          onTap: () {
            this.showCityAlertSheetController(context);
          },
          child: Ink(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: autoTextSize(this.strCity == "" ? "新北全區":this.strCity, TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
          ),
        ),
      )
    );
    switch (this.nowPage) {
      case 0:
        list.add(
          Flexible(
            child: InkWell(
              onTap: () {
                NavigatorUtils.goManual(context);
              },
              child: Ink(
                child: autoTextSize('走馬燈', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
              ),
              
            ),
          ),
        );
        list.add(
          Flexible(
            child: InkWell(
              onTap: (){},
              child: Ink(
                child: autoTextSize('戶籍', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
              ),
            ),
          ),
        );
        list.add(
          Flexible(
            child: InkWell(
              onTap: (){},
              child: Ink(
                child: autoTextSize('回收', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
              ),              
            ),
          ),
        );
        break;
      default:
        list.add(
          Expanded(
            child: Container(),
          )
        );
        list.add(
          Flexible(
            child: InkWell(
              onTap: (){},
              child: Ink(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: autoTextSize('競業', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
              ),
            ),
          ),
        );
        break;
    }
    action = [
      Expanded(
        child: Row(
          children: list
        ),
      ),
    ];
    return action;
  }

  ///Scaffold body顯示
  Widget bodyView() {
      Widget body;
      body = Container(
        ///pageView實現左右換頁
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
    );
    switch (this.nowPage) {
      case 0:
        list.add(
          Flexible(
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 42,
                child: autoTextSize('業績', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
              ),
              onTap: () {
                showRefreshLoading();
              },
            ),
          ),
        );
        break;
      case 1:
        list.add(
          Flexible(
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 42,
                child: autoTextSize('', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
              ),
              onTap: () {
                
              },
            ),
          ),
        );
        break;
      case 2:
        list.add(
          Flexible(
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 42,
                child: autoTextSize('分析', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
              ),
              onTap: () {
                
              },
            ),
          ),
        );
        break;
    }
    list.add(
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
              // NavigatorUtils.goLogin(context);
            },
          ),
        ),
      ),
    );
    list.add(
      Flexible(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            height: 42,
            child: autoTextSize('今日', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context))),
          ),
          onTap: () {
            
          },
        ),
      ),
    );
    list.add(
      Flexible(
        child: GestureDetector(
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
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            leading: Container(),
            actions: actions(),
          ),
          preferredSize: Size.fromHeight(40.0),
        ),
        body: bodyView(),
        bottomNavigationBar: bottomBar(),
      ),
    );
  }
}