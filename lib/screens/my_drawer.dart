import 'package:flutter/material.dart';
import 'package:to_doo/blocs/bloc_exports.dart';
import 'package:to_doo/screens/recycle_bin.dart';
import 'package:to_doo/screens/pending_screen.dart';
import 'package:to_doo/screens/tabs_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(vertical: 14,),
              color: Colors.grey,
              child: Text('Task Drawer',style: Theme.of(context).textTheme.headline5,),
            ),
            BlocBuilder<TasksBloc,TasksState>(
                builder:(context,state){

            return GestureDetector(
              onTap: ()=>Navigator.of(context).pushReplacementNamed(
             TabsScreen.id,
            ),
              child: ListTile(
                leading: Icon(Icons.folder_special),
                title: Text('My Tasks'),
                trailing: Text('${state.allTasks.length}'),
              ),
            );
            },
            ),
            Divider(),
            BlocBuilder<TasksBloc,TasksState>(
              builder:(context,state){
            return GestureDetector(
              onTap: ()=>Navigator.of(context).pushNamed(
                RecycleBin.id),
              child: ListTile(
                leading: Icon(Icons.delete),
                title: Text('Bin'),
                trailing: Text('$state.removedTasks.length'),
              ),
            );},),
          ],
        ),
      ),
    );
  }
}


