import 'package:flutter/material.dart';
import 'package:flutterloginui/calendar/event/eventDataSource.dart';
import 'package:flutterloginui/calendar/event/eventEditingPage.dart';
import 'package:flutterloginui/calendar/event/eventProvider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';


class TasksWidget extends StatefulWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context, listen: false);
    final selectedEvents = provider.eventsOfSelectedDate;

    if(selectedEvents.isEmpty){
      return Center(
        child: Text(
          'No Events Found!',
          style: TextStyle(color: Colors.black, fontSize: 24 ),
        ),
      );
    }
    return SfCalendarTheme(
      data: SfCalendarThemeData(
        timeTextStyle: TextStyle(color: Colors.black, fontSize: 16, )
      ),
      child: SfCalendar(
        view: CalendarView.timelineDay,
        dataSource: EventDataSource(provider.events),
        initialDisplayDate: provider.selectedDate,
        appointmentBuilder: appointmentBuilder,
        headerHeight: 0,
        todayHighlightColor: Colors.black,
        selectionDecoration: BoxDecoration(
          color: Colors.red.withOpacity(0.3),
        ),
        onTap: (details) {
          if(details.appointments == null) return;

          final event = details.appointments!.first;
          
          Navigator.of(context).push(
              MaterialPageRoute(
              builder: (context) => EventEditingPage(event: event),
              )
          );
        },
      ),
    );
  }
Widget appointmentBuilder(
    BuildContext context,
    CalendarAppointmentDetails details,
    ){
    final event = details.appointments.first;
    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
        color: event.backgroundColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          event.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    );
}

}
