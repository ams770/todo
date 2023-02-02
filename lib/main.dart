import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/my_cubit/cubit.dart';
import 'package:todo/my_cubit/states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CounterCubit();
      },
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // <<

                    children: [

                      // minus button
                      FloatingActionButton(
                        child: const Icon(CupertinoIcons.minus),
                        onPressed: () {
                          CounterCubit.get(context).minusCounter();
                        },
                      ),


                      const SizedBox(width: 20),

                      Text(
                        CounterCubit.get(context).counter.toString(),
                        style: const TextStyle(fontSize: 45),
                      ),
                      const SizedBox(width: 20),

                      // plus button
                      FloatingActionButton(
                        onPressed: () {
                         CounterCubit.get(context).plusCounter();
                        },
                        child: const Icon(CupertinoIcons.plus),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}






   


























// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// Task task = Task("Create New Project", false);

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           title: Text(
//             "All Tasks",
//             style: TextStyle(color: Colors.grey.shade700),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.white10,
//         ),
//         body: Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//                 color: Colors.white70,
//               ),
//               child: Row(
//                 children: [
//                   Text(
//                     task.name,
//                     style: TextStyle(
//                       decoration:
//                           task.isDone ? TextDecoration.lineThrough : null,
//                     ),
//                   ),
//                   const Spacer(),
//                   SizedBox(
//                     width: 25,
//                     child: FloatingActionButton(
//                       onPressed: () {
//                         setState(() {
//                           task.isDone = !task.isDone;
//                         });
//                       },
//                       backgroundColor:
//                           task.isDone ? Colors.greenAccent : Colors.grey,
//                       child: const Icon(
//                         Icons.check,
//                         size: 15,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//              Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//                 color: Colors.white70,
//               ),
//               child: Row(
//                 children: [
//                   Text(
//                     task.name,
//                     style: TextStyle(
//                       decoration:
//                           task.isDone ? TextDecoration.lineThrough : null,
//                     ),
//                   ),
//                   const Spacer(),
//                   SizedBox(
//                     width: 25,
//                     child: FloatingActionButton(
//                       onPressed: () {
//                         setState(() {
//                           task.isDone = !task.isDone;
//                         });
//                       },
//                       backgroundColor:
//                           task.isDone ? Colors.greenAccent : Colors.grey,
//                       child: const Icon(
//                         Icons.check,
//                         size: 15,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
            
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Task {
//   String name;
//   bool isDone;
//   Task(this.name, this.isDone);
// }
