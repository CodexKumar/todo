import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../widgets/tasks_list.dart';
import '../screens/add_task_screen.dart';
import '../models/task_data.dart';

class TasksScreen extends StatefulWidget {
  final String title;

  const TasksScreen({Key key, this.title}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _totalTask = 0;

  @override
  Widget build(BuildContext context) {
    _totalTask = Provider.of<TaskData>(context).taskCount;
    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).accentColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            orientation == Orientation.portrait
                ? showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => AddTaskScreen(
                      orientation: orientation,
                    ),
                  )
                : _scaffoldKey.currentState.openEndDrawer();
          },
          child: Icon(
            Icons.add,
            size: 40.0,
            color: kMainColor,
          ),
        ),
        endDrawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                bottomLeft: Radius.circular(32.0),
              ),
            ),
            child: AddTaskScreen(
              orientation: orientation,
            ),
          ),
        ),
        endDrawerEnableOpenDragGesture: false,
        body: Flex(
          direction: orientation == Orientation.portrait
              ? Axis.vertical
              : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: orientation == Orientation.portrait ? 48.0 : 32.0,
                left: orientation == Orientation.portrait ? 32.0 : 48.0,
              ),
              child: Flex(
                direction: orientation == Orientation.portrait
                    ? Axis.vertical
                    : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flex(
                    direction: orientation == Orientation.portrait
                        ? Axis.horizontal
                        : Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: kMainColor,
                        radius: 28.0,
                        child: Icon(
                          Icons.list,
                          color: Theme.of(context).accentColor,
                          size: 36.0,
                        ),
                      ),
                      orientation == Orientation.portrait
                          ? SizedBox(width: 40.0)
                          : SizedBox(height: 40.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'ToDo',
                            style: TextStyle(
                              color: kMainColor,
                              fontSize: 48.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            _totalTask > 1
                                ? '$_totalTask Tasks'
                                : '$_totalTask Task',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kMainColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: orientation == Orientation.portrait ? 32.0 : 0.0,
              width: orientation == Orientation.portrait ? 0.0 : 32.0,
            ),
            Expanded(
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
                  padding: EdgeInsets.all(16.0),
                  child: TasksList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
