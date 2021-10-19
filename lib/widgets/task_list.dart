import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/task.dart';
import 'new_Task.dart';
import 'checkbox.dart';

// ignore: must_be_immutable
class TaskList extends StatefulWidget {
  List<Task> givenTasks;
  Function submitTask;
  Function deleteTask;

  TaskList(this.givenTasks, this.submitTask, this.deleteTask);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool ischecked = false;

  void tsakCompleted(Task cTask, bool vlaue) {
    setState(() {
      cTask.status = vlaue;
    });
  }

  void _startDeletingTask(BuildContext context, String id) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
          child: FloatingActionButton.extended(
            onPressed: () {
              widget.deleteTask(id);
              Navigator.of(context).pop();
            },
            label: Text('Delete'),
            icon: Icon(Icons.delete_outline_rounded),
          ),
        );
      },
    );
  }

  void _changeTask(BuildContext ctx, String id, String task) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTask.edit(id, task, widget.submitTask),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.givenTasks.isEmpty
        ? Center(
            child: Text('No Tasks'),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: widget.givenTasks.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                constraints: BoxConstraints(
                  minHeight: 70,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CheckBox(tsakCompleted, widget.givenTasks[index]),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _changeTask(
                            context,
                            widget.givenTasks[index].id,
                            widget.givenTasks[index].task),
                        onLongPress: () => _startDeletingTask(
                            context, widget.givenTasks[index].id),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: widget.givenTasks[index].status
                                ? Opacity(
                                    opacity: 0.5,
                                    child: Text(
                                      '${widget.givenTasks[index].task}',
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  )
                                : Text('${widget.givenTasks[index].task}'),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    )
                  ],
                ),
              );
            },
          );
  }
}
