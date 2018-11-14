import 'package:flutter/material.dart';
import './widgets/page.dart';
import './widgets/add_task.dart';
import './pages/create_task.dart';
import './models/todo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

List<TodoList> _todoList = [];

class _MyAppState extends State<MyApp> {
  int personal;
  int business;

  void insertTask(TodoList item) {
    //Add the logic here
    print(item);
  }

    void deleteTask(int index, BuildContext context, TodoList _deletedItem) {
      print(_todoList);
    _todoList.removeAt(index);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Task deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            insertTask(_deletedItem);
          },
        ),
      ),
    );

  }

  void _updatePage(newTask) {
    setState(() {
      _todoList = newTask;
    });
  }



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tera',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "createNewTask": (BuildContext context) => CreateTask(_todoList),
      },
      home: new Scaffold(
        body: HomePage(_todoList, deleteTask),
        floatingActionButton: AddTask(_updatePage),
      ),
    );
  }
}
