import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/note.dart';

// ignore: must_be_immutable
class NewNote extends StatelessWidget {
  DateTime dateTime;
  String note;
  type noteType;

  NewNote(this.dateTime, this.note, this.noteType);

  String setNoteType() {
    if (noteType == type.important)
      return 'Permanent Marker';
    else if (noteType == type.quote)
      return 'Niconne';
    else
      return 'Patrick Hand';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            constraints: BoxConstraints(maxHeight: 150),
            child: Text(
              note,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontFamily: setNoteType(),
                fontSize: 20,
              ),
            ),
          ),
          Container(
            child: Text(
              DateFormat('d-MMM-y').format(dateTime),
              style: TextStyle(fontSize: 14, color: Colors.blueGrey),
            ),
          )
        ],
      ),
    );
  }
}
