import 'package:flutter/material.dart';
import 'package:to_doo/blocs/bloc_exports.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding: EdgeInsets.only(
          bottom:MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Add Task',style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller:titleController ,
              decoration: InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: () => Navigator.pop(context),
                  child:Text('cancel'),),
                ElevatedButton(onPressed: () {
                  var task =Task(
                    title: titleController.text,
                  );
                  context.read<TasksBloc>().add(AddTask(task:task));
                  Navigator.pop(context);
                }, child: Text('Add'),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
