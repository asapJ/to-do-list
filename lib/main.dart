import 'package:flutter/material.dart';
import './widgets/page.dart';
import './widgets/add_task.dart';
import './pages/create_task.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

List<Map<String, dynamic>> _todoList = [];

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  void fillTasks() {
    for (var i = 0; i < 30; i++) {
      Map<String, dynamic> values = {
        "Task": "Task ${i + 1}",
        "Location": "Lagos",
        "Time": "10:00"
      };
      _todoList.add(values);
    }
  }

  void insertTask() {
    //Add the logic here
  }

  @override
  Widget build(BuildContext context) {
    fillTasks();
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tera',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "createNewTask": (BuildContext context) => CreateTask(),
      },
      home: new Scaffold(
        body: HomePage(_todoList, insertTask),
        floatingActionButton: AddTask(),
      ),
    );
  }
}
