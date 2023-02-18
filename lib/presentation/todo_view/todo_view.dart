import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/todo_cubit/todo_cubit.dart';
import 'package:todo/presentation/todo_cubit/todo_states.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(context) => TodoCubit()
          ..init()
         ,
        child: const TodoConsumer(),
    );
  }
}


class TodoConsumer extends StatelessWidget {
  const TodoConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state){},
      builder: (context, state) => TodoScaffold(),
    );
  }
}


class TodoScaffold extends StatelessWidget {

  TodoScaffold({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    TodoCubit cubit = TodoCubit.get(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        title: const AppTitle(),
        centerTitle: true,

      ),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 2  ),

        child: ListView.builder(
            itemCount: cubit.myTodos.length,
            itemBuilder: (context, index){
              return cubit.myTodos[index];
            }
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scaffoldKey.currentState!.showBottomSheet(
                  (context) => MyBottomSheet(
                    onTap: (String value) {
                      cubit.addTodo(value);
                    },
                  )
          );
        },
        child: const Icon(CupertinoIcons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}




class MyBottomSheet extends StatelessWidget {
   MyBottomSheet({Key? key, required this.onTap}) : super(key: key);

  final void Function(String) onTap;
  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      height: 300,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TextFormField(
                controller: todoController,
                decoration:InputDecoration(
                  hintText: "Write here your task",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    ),

                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.lightBlue,
                      ),
                  ),



                ) ,
              ),
            ),


            const SizedBox(height: 20,),


            MaterialButton(
              color: Colors.lightBlue,

               onPressed: (){
                  onTap(todoController.text);
               },

              child: const Text("add", style: TextStyle(color: Colors.white),),
            )

          ],
        ),
      ),
    );
  }
}






class MyTodoContainer extends StatelessWidget {

  const MyTodoContainer({Key? key, required this.todoName,required this.isDone}) : super(key: key);

  final String todoName;
  final bool isDone;

  @override
  Widget build(BuildContext context) {

    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2  ),

      margin:  const EdgeInsets.symmetric( vertical: 4  ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(todoName),

          Checkbox(
            value: isDone,
            shape: const CircleBorder(),
            onChanged: (val){},
          )
        ],
      ),
    );
  }
}





class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Text(
      "All Tasks",
      style: TextStyle(
        fontSize: 25,
        color: Colors.white
      ),
    );
  }
}
