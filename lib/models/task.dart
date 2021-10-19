import 'package:flutter/material.dart';

class Task {
  final String id;
  bool status = false;
  String task;
  final TimeOfDay reminder;

  Task(@required this.id, this.task, @required this.reminder,
      @required this.status);
}
