import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/note_screen.dart';

import 'new_note.dart';

// ignore: must_be_immutable
class NotesList extends StatelessWidget {
  final Function submitNote;
  final Function deleteNoteF;
  List<Note> notes = [];

  NotesList(this.deleteNoteF, this.submitNote, this.notes);

  void deleteNote(BuildContext ctx, DateTime cTime) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
          child: FloatingActionButton.extended(
            onPressed: () {
              deleteNoteF(cTime);
              Navigator.of(ctx).pop();
            },
            label: Text('Delete'),
            icon: Icon(Icons.delete_outline_rounded),
          ),
        );
      },
    );
  }

  void _editNote(BuildContext ctx, int index) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return NoteScreen.edit(
              submitNote, notes[index].note, notes[index].createdTime);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: notes.isEmpty
          ? Center(
              child: Text('Add Notes'),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: NewNote(notes[index].createdTime, notes[index].note),
                  onLongPress: () =>
                      deleteNote(context, notes[index].createdTime),
                  onTap: () => _editNote(context, index),
                );
              }),
    );
  }
}
