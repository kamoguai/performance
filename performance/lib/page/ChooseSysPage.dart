

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:performance/common/style/MyStyle.dart';
import 'package:performance/common/utils/NavigatorUtils.dart';
import 'package:performance/widget/BaseWidget.dart';
///
///選擇系統頁面
///Date: 2019-07-23
class ChooseSysPage extends StatefulWidget {
  static final String sName = "chooseSys";

  @override
  _ChooseSysPageState createState() => _ChooseSysPageState();
}

class _ChooseSysPageState extends State<ChooseSysPage> with BaseWidget {


  @override
  autoTextSize(text, style, context) {
    var fontSize = MyScreen.homePageFontSize(context);
    var fontStyle = TextStyle(fontSize: fontSize);
    return AutoSizeText(
      text,
      style: style.merge(fontStyle),
      minFontSize: 5.0,
      textAlign: TextAlign.center,
    );
  }



  ///app bar action
  List<Widget> actions() {
    List<Widget> list = [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(width: deviceWidth4(context),),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: deviceWidth3(context) * 1.1,
              child: FlatButton.icon(
                icon: Image.asset('static/images/24.png'),
                color: Colors.transparent,
                label: Text(''),
                onPressed: (){
                  NavigatorUtils.goLogin(context);
                },
              ),
            ),
            SizedBox(width: deviceWidth4(context),),
          ],
        ),
      )
    ];
    return list;
  }
  ///body內容
  Widget bodyView() {
    Widget body = Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: Color(MyColors.hexFromStr('#eeeeee')),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: autoTextSize('業績系統', TextStyle(color: Colors.black, fontWeight: FontWeight.bold), context),
          ),
          Container(
            child: OutlineButton(
              borderSide: BorderSide(width: 1.0, color: Colors.blueAccent, style: BorderStyle.solid),
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              child: autoTextSize('MSO', TextStyle(color: Colors.black, fontWeight: FontWeight.bold), context),
              onPressed: (){},
            ),
          ),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: OutlineButton(
                  borderSide: BorderSide(width: 1.0, color: Colors.blueAccent, style: BorderStyle.solid),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  child: autoTextSize('新北市', TextStyle(color: Colors.black, fontWeight: FontWeight.bold), context),
                  onPressed: () {

                  },
                ),
              ),
              Container(
                child: OutlineButton(
                  borderSide: BorderSide(width: 1.0, color: Colors.blueAccent, style: BorderStyle.solid),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  child: autoTextSize('全國', TextStyle(color: Colors.black, fontWeight: FontWeight.bold), context),
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
          Container(
            child: OutlineButton(
              borderSide: BorderSide(width: 1.0, color: Colors.blueAccent, style: BorderStyle.solid),
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              child: autoTextSize('SO-系統', TextStyle(color: Colors.black, fontWeight: FontWeight.bold), context),
              onPressed: () {
                NavigatorUtils.goHome(context);
              },
            ),
          ),
          Container(
            child: FlatButton(
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
              color: Colors.blueAccent,
              child: autoTextSize("登出", TextStyle(color: Colors.black), context),
              onPressed: () {
                NavigatorUtils.goLogin(context);
              },
            ),
          ),
          Padding(
            padding: new EdgeInsets.only(
                left: 30.0, top: 0.0, right: 30.0, bottom: 0.0),
            child: new Image(
                image: new AssetImage('static/images/logo.png')),
          ),
        ],
      )
    );

    return body;
  }
  ///tool bar 
  Widget bottomBar() {
    Widget bottom = Material(
      color: Theme.of(context).primaryColor,
      child: Container(
        height: 42,
      )
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