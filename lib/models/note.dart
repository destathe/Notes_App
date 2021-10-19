import 'package:flutter/material.dart';

class Note {
  final String note;
  final DateTime createdTime;

  Note(this.note, this.createdTime);
}

class ColorCombo {
  final Color textC;
  final Color bgC;

  ColorCombo(this.textC, this.bgC);
}
