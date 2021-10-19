import 'package:flutter/material.dart';
import '../models/task.dart';

class CheckBox extends StatefulWidget {
  final Function completeTask;
  Task cTask;
  CheckBox(this.completeTask, this.cTask);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: CircleBorder(),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          widget.completeTask(widget.cTask, isChecked);
        });
      },
    );
  }
}
