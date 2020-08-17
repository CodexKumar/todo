import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final Orientation orientation;

  const AddTaskScreen({
    Key key,
    @required this.orientation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTask;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: orientation == Orientation.portrait
                ? Radius.circular(32.0)
                : Radius.zero,
            bottomLeft: orientation == Orientation.portrait
                ? Radius.zero
                : Radius.circular(32.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: orientation == Orientation.portrait
                ? EdgeInsets.all(32.0)
                : EdgeInsets.symmetric(
                    vertical: 32.0,
                    horizontal: 64.0,
                  ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (value) {
                    newTask = value;
                  },
                ),
                SizedBox(height: 32.0),
                FlatButton(
                  onPressed: () {
                    if (newTask != null) {
                      Provider.of<TaskData>(context).addTask(newTask);
                    }
                    Navigator.of(context).pop();
                  },
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Add',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: kMainColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
