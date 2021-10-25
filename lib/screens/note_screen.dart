import 'package:flutter/material.dart';

import '../models/note.dart';

TextEditingController _noteController = TextEditingController();

// ignore: must_be_immutable
class NoteScreen extends StatefulWidget {
  String initnote = '';
  bool mode = false;
  Function submitNote;
  DateTime oTime = DateTime(0, 0, 0, 0, 0);

  NoteScreen.add(this.submitNote) {
    _noteController.text = '';
  }
  NoteScreen.edit(this.submitNote, this.initnote, this.oTime) {
    _noteController.text = initnote;
    mode = true;
    print('editscreen');
  }

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  String note = '';
  String dropdownValue = 'Normal';

  type setNoteType() {
    if (dropdownValue == 'Important')
      return type.important;
    else if (dropdownValue == 'Quote')
      return type.quote;
    else
      return type.normal;
  }

  void _submitData(BuildContext ctx) {
    setState(() {
      note = _noteController.text;
    });
    widget.submitNote(
      DateTime.now(),
      note,
      widget.mode,
      widget.oTime,
      setNoteType(),
    );

    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Normal', 'Important', 'Quote']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          IconButton(
            onPressed: () => _submitData(context),
            icon: Icon(Icons.check_rounded),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
        child: TextField(
          maxLines: 15,
          decoration: InputDecoration(
            hintText: 'Enter note ...',
            border: InputBorder.none,
          ),
          controller: _noteController,
        ),
      ),
    );
  }
}
