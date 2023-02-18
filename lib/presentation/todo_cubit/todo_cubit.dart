import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/todo_cubit/todo_states.dart';

import '../../data/local_database.dart';
import '../todo_view/todo_view.dart';

class TodoCubit extends Cubit<TodoStates>{
  TodoCubit() : super(TodoInitialState());

  static TodoCubit get(context) => BlocProvider.of(context);

  MyLocalDatabase myDb = MyLocalDatabase();


  init()async{
    await myDb.openMyDatabase();
    getMyTodos();
  }

  int todoNum = 1;

  addTodo(String todData)async{
    Task newTask = Task(0, todData, 0);
    await myDb.addTask(newTask);
    getMyTodos();
    emit(AddTodoState());
  }


  changeTaskState(Task task){
    task.isDone = task.isDone == 0 ? 1 : 0;
    /// call update task method and send needed task
  }

  getMyTodos()async{

    List<Task> myTasks = await myDb.getTasks();
    myTasks = myTasks.reversed.toList();
    myTodos = [];
    for(var task in myTasks){
      myTodos.add(
          MyTodoContainer(
            todoName: task.data,
            isDone: task.isDone == 1,

          ),
      );
    }

    emit(GetTodoState());
  }



  List<Widget> myTodos=[];



  printName(){
    print("Name");
  }

}