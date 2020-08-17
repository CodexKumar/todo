import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/tasks_screen.dart';
import './models/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      builder: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 24.0,
            ),
          ),
          canvasColor: Colors.transparent,
        ),
        home: TasksScreen(title: 'Tasks Screen'),
      ),
    );
  }
}
