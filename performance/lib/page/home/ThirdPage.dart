import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:performance/widget/MyListState.dart';
///
///首頁第三頁-分析頁
///Date: 2019-07-29
class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> with AutomaticKeepAliveClientMixin<ThirdPage>, MyListState<ThirdPage>{
  
  
  @override
  void initState() {
    super.initState();
    clearData();
    Fluttertoast.showToast(msg: "第三頁");
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
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}