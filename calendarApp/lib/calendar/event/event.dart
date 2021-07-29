import 'package:flutter/material.dart';
class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final backgroundColor;
  final bool isAllDay;

  const Event({
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    this.backgroundColor = const Color(0xFFF2B501),
    this.isAllDay = false
  });

}