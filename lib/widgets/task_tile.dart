import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool isChecked;
  final Function checkboxCallback;
  final Function onLongPressCallback;

  const TaskTile({
    @required this.taskName,
    @required this.isChecked,
    @required this.checkboxCallback,
    @required this.onLongPressCallback,
  }) : assert(
            taskName != null && isChecked != null && checkboxCallback != null);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$taskName',
        style: TextStyle(
          fontSize: 20.0,
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: onLongPressCallback,
    );
  }
}
