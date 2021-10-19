import 'package:flutter/material.dart';

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
  void _submitData(BuildContext ctx) {
    setState(() {
      note = _noteController.text;
    });
    widget.submitNote(
      DateTime.now(),
      note,
      widget.mode,
      widget.oTime,
    );

    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _submitData(context),
            icon: Icon(Icons.check_rounded),
          )
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
