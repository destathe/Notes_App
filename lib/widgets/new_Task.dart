import 'package:flutter/material.dart';

TextEditingController _taskController = TextEditingController();

// ignore: must_be_immutable
class NewTask extends StatefulWidget {
  Function submitTask;
  String findId = '';
  String task = '';
  bool submit = false;
  NewTask.add(this.submitTask) {
    _taskController.text = '';
  }
  NewTask.edit(this.findId, this.task, this.submitTask) {
    submit = true;
    _taskController.text = task;
  }

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String _note = '';
  String iconText = 'Add Reminder';
  TimeOfDay selectedTime = TimeOfDay.now();

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
        iconText =
            '${selectedTime.hour}:${selectedTime.minute}${selectedTime.period.toString().split('.')[1]}';
        print(selectedTime);
      });
    }
  }

  void _submitData() {
    _note = _taskController.text;

    widget.submitTask(
        DateTime.now().toString(), _note, selectedTime, true, widget.findId);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: 'Enter your text here',
                    border: InputBorder.none,
                  ),
                  controller: _taskController,
                  onSubmitted: (_) => _submitData(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton.extended(
                    onPressed: _selectTime,
                    label: Text(iconText),
                    icon: Icon(Icons.add_alarm_rounded),
                  ),
                  TextButton(onPressed: _submitData, child: Text('Done'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
