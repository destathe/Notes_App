import 'package:flutter/material.dart';
import 'widgets/notes_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      home: NotesApp(),
    );
  }
}
