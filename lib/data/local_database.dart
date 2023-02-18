import 'package:sqflite/sqflite.dart';
class MyLocalDatabase {

  late Database myDatabase;

  openMyDatabase()async{

    myDatabase = await openDatabase(
       "My_Todo",
       version: 1,
       onCreate: (Database db,int ver)async{
         // When creating the db, create the table
         await db.execute('CREATE TABLE Tasks (id INTEGER PRIMARY KEY, value TEXT, isDone INTEGER)');
         print("Tasks table created");
       },

       onOpen: (Database db)async{
         print("Tasks table opened");


       }

     );

  }



  updateTask(Task task){
    ///todo
    ///add update task logic here using id
  }


  addTask(Task task)async{
   await myDatabase.transaction((txn)async{
      txn.rawInsert('INSERT INTO Tasks(value, isDone) VALUES("${task.data}", ${0})'
      );
    });
  }


  Future<List<Task>> getTasks()async{

    List<Map<String, dynamic>> list = await myDatabase.rawQuery('SELECT * FROM Tasks');
    List<Task> myTasks =[];

    for(var task in list) {
      int id = task["id"];
      String value = task["value"];
      int isDone = task["isDone"];
      myTasks.add(Task(id, value, isDone));
    }

    return myTasks;

  }

}





class Task{
  int id;
  String data;
  int isDone; // 0 = false, 1 = true
  Task(this.id, this.data, this.isDone);
}


