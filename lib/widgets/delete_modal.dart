import 'package:flutter/material.dart';

class DeleteModal extends StatelessWidget {
  final Function deleteTask;
  final String id;

  DeleteModal(this.deleteTask, this.id);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey, width: 2)),
          child: Row(
            children: <Widget>[
              Text('Delete'),
              Icon(Icons.delete_outline_rounded),
            ],
          ),
        ),
        onTap: () {
          deleteTask(id);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
