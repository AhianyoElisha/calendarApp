import 'package:flutter/material.dart';
import 'package:flutterloginui/calendar/calendarWidget.dart';
import 'package:flutterloginui/calendar/event/eventEditingPage.dart';

class CalendarPage extends StatelessWidget {

  const CalendarPage() : super();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Container(

          margin: EdgeInsets.only(top: 70,bottom: 30),
          child: Scaffold(
          body: CalendarWidget(),
          floatingActionButton:FloatingActionButton(
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Color(0xFFF2B501),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>EventEditingPage()),
          ),
          )
    ,
      ),
        ),
      );
}

