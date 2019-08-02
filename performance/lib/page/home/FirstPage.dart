import 'package:flutter/material.dart';
import 'package:performance/widget/MyCalendarWidget.dart';
import 'package:performance/widget/MyListState.dart';

///
///首頁第一頁
///Date: 2019-07-29
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with AutomaticKeepAliveClientMixin<FirstPage>, MyListState<FirstPage>{


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

Widget bodyView() {
    Widget body;
    body = Column(
      children: <Widget>[
        MyCalendarWidget(),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Text('應該會有字啊？', ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Text('殺蛇？', ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Text('旺旺旺？', ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Text('喵喵喵？', ),
                ),
              ],
            ),
          ),
        )
      ],
    );
    return body;
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: bodyView(),
    );
  }
}