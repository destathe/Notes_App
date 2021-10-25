import 'package:flutter/material.dart';

import '../screens/note_screen.dart';
import 'notes_list.dart';
import '../models/task.dart';
import '../models/note.dart';
import 'new_Task.dart';
import 'task_list.dart';

class NotesApp extends StatefulWidget {
  @override
  _NotesAppState createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  List<Task> _tasks = [];
  List<Note> _notes = [];
  bool tMode = false;

  String findId = '';
  bool mode = false;

  void settingsPressed() {}

  void _submitTask(String id, String task, TimeOfDay setTime, mode, findId) {
    Task givenTask = new Task(id, task, setTime, false);
    setState(() {
      _tasks.add(givenTask);
    });
    if (mode) _deleteTask(findId);
  }

  void _addTask(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTask.add(_submitTask),
        );
      },
    );
  }

  void _deleteTask(String id) {
    print('in delete');
    setState(() {
      _tasks.removeWhere((task) => task.id == id);
    });
  }

  void _submitNote(
      DateTime ntime, String note, mode, DateTime oTime, type noteType) {
    Note givenNote = Note(note, ntime, noteType);
    setState(() {
      _notes.add(givenNote);
    });
    if (mode) _deleteNote(oTime);
  }

  void _addNote(BuildContext ctx) {
    print('addnote');
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return NoteScreen.add(_submitNote);
        },
      ),
    );
  }

  void _deleteNote(DateTime cTime) {
    print('in delete');
    setState(() {
      _notes.removeWhere((note) => note.createdTime == cTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: TabBar(
            onTap: (index) {
              print(index);
              print('tap');
              if (index == 1)
                setState(
                  () {
                    tMode = true;
                  },
                );
              else
                setState(
                  () {
                    tMode = false;
                  },
                );
            },
            tabs: [
              Tab(icon: Icon(Icons.sticky_note_2_rounded)),
              Tab(icon: Icon(Icons.task_alt_rounded)),
            ],
          ),
          actions: <Widget>[
            IconButton(
              onPressed: settingsPressed,
              icon: Icon(Icons.more_vert),
            )
          ],
        ),
        body: Container(
          child: TabBarView(
            children: [
              TaskList(_tasks, _submitTask, _deleteTask),
              NotesList(_deleteNote, _submitNote, _notes),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => tMode ? _addNote(context) : _addTask(context),
        ),
      ),
    );
  }
}
