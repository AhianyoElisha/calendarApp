import 'package:flutter/material.dart';
import 'package:flutterloginui/calendar/event/eventProvider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'package:flutterloginui/calendar/event/tasksWidget.dart';
import 'package:flutterloginui/calendar/event/eventDataSource.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget() : super();

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    return SfCalendar(
      view: CalendarView.month,
      dataSource: EventDataSource(events),
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      onLongPress: (details) {
        final provider = Provider.of<EventProvider>(context, listen:  false);
        provider.setDate(details.date!);
        showModalBottomSheet(context: context,
            builder: (context) => TasksWidget(),
        );
      },
    ) ;
  }
}