import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets.dart';
import 'my_drawer.dart';
import 'package:to_doo/blocs/bloc/tasks_bloc.dart';
class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const id= 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc,TasksState>(
        builder: (context,state){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Recycle Bin')),
        actions:[
          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
        ],
      ),
      drawer:MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: Text(
                '${state.removedTasks.length} Tasks',
              ),
            ),
          ),
          TaskList(tasksList:state.removedTasks)
        ],
      ),
    );},);
  }
}
