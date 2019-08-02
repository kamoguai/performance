import 'package:flutter/material.dart';
import 'package:performance/widget/MyListState.dart';
///
///首頁第二頁-主管頁
///Date: 2019-07-29
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with AutomaticKeepAliveClientMixin<SecondPage>, MyListState<SecondPage>{
  
  
@override
  void initState() {
    super.initState();
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


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
    );
  }
}