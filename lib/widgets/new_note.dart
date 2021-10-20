import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class NewNote extends StatelessWidget {
  DateTime dateTime;
  String note;

  NewNote(this.dateTime, this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            constraints: BoxConstraints(maxHeight: 100),
            child: Text(
              note,
              overflow: TextOverflow.fade,
            ),
          ),
          Container(
            child: Text(
              DateFormat('d-MMM-y').format(dateTime),
              style: TextStyle(fontSize: 10, color: Colors.blueGrey),
            ),
          )
        ],
      ),
    );
  }
}
