import 'package:flutter/material.dart';
import 'package:to_doo/screens/my_drawer.dart';
import 'package:to_doo/screens/pending_screen.dart';

import 'add_task.dart';
import 'completed_screen.dart';


class TabsScreen extends StatelessWidget {
   TabsScreen({super.key});
static const id='tabs_screen';

final List <Map<String,dynamic>> _pageDetails =[
  {'pageName': PendingTasksScreen(), 'title': 'Pending Tasks'},
  {'pageName': CompletedTasksScreen(), 'title': 'Completed Tasks'},
];
];

  void _addTask(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const AddTaskScreen(),
            ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Screen'),
        actions:[
          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
        ],
      ),
      drawer: MyDrawer(),
      body: TabsScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.list),
        label: 'Pending Tasks'
        ),
          BottomNavigationBarItem(icon:Icon(Icons.done),
              label: 'Completed Tasks'
          ),
        ],
      ),
    );
  }
}
