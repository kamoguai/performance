

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:performance/page/ChooseSysPage.dart';
import 'package:performance/page/LoginPage.dart';
import 'package:performance/page/home/HomePage.dart';
import 'package:performance/page/marquee/ManualPage.dart';
import 'package:performance/page/marquee/MarqueeListPage.dart';

///
///導航欄
///Date: 2019-06-04
///
class NavigatorUtils {
  ///替換
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///切換無參數頁面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
  ///一般跳轉頁面
  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => widget));
  }
  ///跳轉至頁面並移除上一頁
  static NavigatorRemoveRouter(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(context, new CupertinoPageRoute(builder: (context) => widget), null);
  }
  ///登入頁
  static goLogin(BuildContext context, {isAutoLogin}) {
    if (isAutoLogin != null  && isAutoLogin != false) {
      NavigatorRouter(context, LoginPage(isAutoLogin: isAutoLogin));
    }
    else {
      Navigator.pushReplacementNamed(context, LoginPage.sName);
    }
  }
  ///跳回登入頁
  static goTopLogin(BuildContext context) {
    NavigatorRemoveRouter(context, LoginPage());
  }
  ///選擇系統頁面
  static goChooseSys(BuildContext context) {
    Navigator.pushReplacementNamed(context, ChooseSysPage.sName);
  }
  ///首頁
  static goHome(BuildContext context) {
    NavigatorRouter(context, HomePage());
  }
  ///走馬燈操作說明頁面
  static goManual(BuildContext context) {
    NavigatorRouter(context, ManualPage());
  }

  ///走馬燈列表頁面
  static goMarqeeList(BuildContext context) {
    NavigatorRouter(context, MarqueeListPage());
  }

  
  
}