
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
///
///日期選擇widget
///Date: 2019-07-24
class MyCalendarWidget extends StatefulWidget {
  @override
  _MyCalendarWidgetState createState() => _MyCalendarWidgetState();
}

class _MyCalendarWidgetState extends State<MyCalendarWidget> with TickerProviderStateMixin {

  DateTime _selectedDay;
  Map<DateTime, List> _events;
  Map<DateTime, List> _visibleEvents;
  List _selectedEvents;
  AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
   
    _selectedEvents = [];
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400)
    );
    _controller.forward();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
      
    });
  }

  ///cladar相關style顯示
  Widget _buildTableCalendar() {
    return TableCalendar(
      ///多國語
      locale: 'zh_CN',
      ///顯示事件
      events: {},
      ///顯示假期
      holidays: {},
      ///初始化要顯示week, twoweek, month
      initialCalendarFormat: CalendarFormat.month,
      ///動畫演示
      formatAnimation: FormatAnimation.slide,
      ///起始日，可選週一或週日
      startingDayOfWeek: StartingDayOfWeek.monday,
      ///操作行為
      availableGestures: AvailableGestures.all,
      ///日曆格式
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        // CalendarFormat.twoWeeks: '2 weeks',
        // CalendarFormat.week: 'Week',
      },
      ///日曆style
      calendarStyle: CalendarStyle(
        ///所選定日期顏色
        selectedColor: Colors.deepOrange[400],
        ///今天顏色
        todayColor: Colors.blue[200],
        ///註記顏色
        markersColor: Colors.brown[700],
      ),
      ///右上方可選週期按鈕style
      headerStyle: HeaderStyle(
        titleTextStyle: TextStyle(fontSize: 12),
        centerHeaderTitle: true,
        formatButtonVisible: false
      ),
      rowHeight: 30,
      ///選定日期
      onDaySelected: _onDaySelected,
      ///切換日期
      // onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(20),
      child: _buildTableCalendar(),
    );
    // return Container(
    //   child: SingleChildScrollView(
    //     scrollDirection: Axis.vertical,
    //     child: Column(
    //       children: <Widget>[
    //         _buildTableCalendar()
    //       ],
    //     )
    //   ),
    // );
  }
}