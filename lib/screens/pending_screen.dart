


import 'package:flutter/material.dart';
import 'package:to_doo/models/task.dart';
import 'package:to_doo/screens/my_drawer.dart';
import 'package:to_doo/widgets.dart';
import 'package:to_doo/blocs/bloc_exports.dart';
import 'add_task.dart';
import 'tabs_screen.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key?key}) :super(key: key);
  static const id = 'tasks_screen';


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc,TasksState>(
      builder: (context,state) {
        List<Task>tasksList=state.allTasks;
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.allTasks.length} Tasks',
                  ),
                ),
              ),
              TaskList(tasksList: tasksList)
            ],
        );
      },
    );
  }
}

