import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterloginui/calendar/event/event.dart';

class EventProvider extends ChangeNotifier {
    final List<Event> _events = [];

    List<Event> get events => _events;

    DateTime _seletedDate = DateTime.now();

    DateTime get selectedDate => _seletedDate;

    void setDate(DateTime date) => _seletedDate = date;

    List<Event> get eventsOfSelectedDate => _events;

    void addEvents(Event event) {
      _events.add(event);

      notifyListeners();
    }
    void deleteEvents(Event event) {
      _events.remove(event);

      notifyListeners();
    }
    void editEvents(Event newEvent, Event oldEvent) {
      final index = _events.indexOf(oldEvent);
      _events[index] = newEvent;

      notifyListeners();
    }
}