import 'package:flutter/foundation.dart';
import './task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _taskList = <Task>[
    Task(name: 'Create Adroit App'),
    Task(name: 'Improve Laravel Skill'),
    Task(name: 'Buy a new iPad Pro'),
    Task(name: 'Search for Apple Glasses'),
    Task(name: 'Have fun!'),
  ];

  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);

  int get taskCount => _taskList.length;

  void addTask(String taskName) {
    _taskList.add(Task(name: taskName));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }
}
