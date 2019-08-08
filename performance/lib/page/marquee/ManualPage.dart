import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:performance/common/style/MyStyle.dart';
import 'package:performance/common/utils/NavigatorUtils.dart';
import 'package:performance/widget/BaseWidget.dart';

///
///走馬燈操作說明頁
///Date: 2019-08-05
class ManualPage extends StatelessWidget with BaseWidget {

  ///覆寫自動縮放
  @override
  autoTextSize(text, style, context) {
   
    return AutoSizeText(
      text,
      style: style,
      minFontSize: 5.0,
      textAlign: TextAlign.left,
    );
  }

  ///appbar actions
  List<Widget> actions(context) {
    List<Widget> list = [];
    list.add(
      Expanded(
        child: Container(
          alignment: Alignment.center,
          child: autoTextSize("走馬燈使用說明", TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context)), context)
        ),
      )
    );
    return list;
  }

  ///Scaffold body widget
  Widget bodyView(context) {
    List<Widget> list = [
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: autoTextSize("<1> 字體顏色、字型、色底、頻道、間隔皆為預設值，不用選。", TextStyle(color: Colors.black, fontSize: MyScreen.defaultTableCellFontSize(context)), context),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: autoTextSize("<2> 區域可選，選擇後僅以該區發送走馬燈。", TextStyle(color: Colors.black, fontSize: MyScreen.defaultTableCellFontSize(context)), context),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: autoTextSize("<3> 起迄時間、排期時間、說明、走馬燈內文皆為必填欄位。", TextStyle(color: Colors.black, fontSize: MyScreen.defaultTableCellFontSize(context)), context),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: autoTextSize("<4> 『起迄時間』為，設定走馬燈要在幾月幾日開始和結束。", TextStyle(color: Colors.black, fontSize: MyScreen.defaultTableCellFontSize(context)), context),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: autoTextSize("<5> 結束時間若小於今日時間，該筆走馬燈會變成歷史資料。", TextStyle(color: Colors.black, fontSize: MyScreen.defaultTableCellFontSize(context)), context),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: autoTextSize("<6> 『排期時間』為，設定走馬燈要在該區段跑多久時間，e.g.設置時間為10:00-10:01，就是讓走馬燈跑一分鐘，時間可以設定多組。", TextStyle(color: Colors.black, fontSize: MyScreen.defaultTableCellFontSize(context)), context),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: autoTextSize("<7> 起日選擇不該小於訖日。", TextStyle(color: Colors.black, fontSize: MyScreen.defaultTableCellFontSize(context)), context),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: autoTextSize("<8> 排期時間若不在起訖時間內，會變成無效排期，走馬燈就會失效。", TextStyle(color: Colors.black, fontSize: MyScreen.defaultTableCellFontSize(context)), context),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: autoTextSize("<9> 有審核權限可以看到審核按鈕。", TextStyle(color: Colors.black, fontSize: MyScreen.defaultTableCellFontSize(context)), context),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: autoTextSize("<10> 有審核權限才可以審核、下架。", TextStyle(color: Colors.black, fontSize: MyScreen.defaultTableCellFontSize(context)), context),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: autoTextSize("<11> 畫面左下角『一鍵複製』可以複製標題與內文。", TextStyle(color: Colors.black, fontSize: MyScreen.defaultTableCellFontSize(context)), context),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: autoTextSize("<12> 『一鍵複製』後，再新增畫面會變成『一鍵貼上』方便填寫重複文案。", TextStyle(color: Colors.black, fontSize: MyScreen.defaultTableCellFontSize(context)), context),
            ),            
          ],
        ),
      ),
    ];

    list.add(
      Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: OutlineButton(
          onPressed: (){
            NavigatorUtils.goMarqeeList(context);
          },
          color: Colors.grey,
          child: autoTextSize('開始使用', TextStyle(color: Colors.black, fontSize: MyScreen.defaultTableCellFontSize(context)), context),
        ),
      )
    );

    Widget body = Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: list
      ),
      
    );
    return body;
  }

  ///Scaffold bottomBar widget
  Widget bottomBar(context) {
    List<Widget> list = [];
    list.add(
      Expanded(
        child: Container(height: 42,),
      ),
    );
    list.add(
      GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          height: 42,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: autoTextSize("返回", TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context)), context),
        ),
      )
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
            actions: actions(context),
          ),
          preferredSize: Size.fromHeight(40.0),
        ),
        body: bodyView(context),
        bottomNavigationBar: bottomBar(context),
      ),
    );
  }
}