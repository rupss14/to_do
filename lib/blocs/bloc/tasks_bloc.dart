import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:to_doo/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';



class TasksBloc extends Bloc<TasksEvent, TasksState>{
  TasksBloc() : super(const TasksState()){

    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<AddTask>(_onAddTask);
    on<RemoveTask>(_onRemoveTask);

    }

    void _onAddTask(AddTask event , Emitter<TasksState> emit) {
    final state =this.state;
    emit(TasksState(
      allTasks: List.from(state.allTasks)..add(event.task),
      removedTasks: state.removedTasks,
    ));
    }

  void _onUpdateTask(UpdateTask event , Emitter<TasksState> emit){
    final state =this.state;
    final task =event.task;
    final int index =state.allTasks.indexOf(task);


    List<Task> allTasks =List.from(state.allTasks)..remove(task);
    task.isDone ==false
       ? allTasks.insert(index,task.copyWith(isDone: true))
        : allTasks.insert(index,task.copyWith(isDone:false));

    emit(TasksState(allTasks:allTasks,removedTasks: state.removedTasks,));
  }

  void _onDeleteTask(DeleteTask event , Emitter<TasksState> emit){
    final state =this.state;
    emit(TasksState(
      allTasks: state.allTasks,
      removedTasks: List.from(state.removedTasks)..remove( event .task),
    ));
  }

  void _onRemoveTask(RemoveTask event , Emitter<TasksState> emit){
    final state =this.state;
    emit(TasksState(
      allTasks: List.from(state.allTasks)..remove(event.task),
      removedTasks: List.from(state.removedTasks)
        ..add(event.task.copyWith((isDeleted: true)),)
    ));
  }

  @override
  TasksState? fromJson(Map<String,dynamic> json){
    return TasksState.fromMap(json);
  }

  @override
  Map<String,dynamic>?toJson(TasksState state){
    return state.toMap();
  }
}
