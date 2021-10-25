import 'package:flutter/material.dart';

enum type { normal, important, quote }

class Note {
  final String note;
  final DateTime createdTime;
  final type noteType;

  Note(this.note, this.createdTime, this.noteType);
}

class ColorCombo {
  final Color textC;
  final Color bgC;

  ColorCombo(this.textC, this.bgC);
}
