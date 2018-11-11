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

  void insertTask() {
    //Add the logic here
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
        body: HomePage(_todoList, insertTask),
        floatingActionButton: AddTask(_updatePage),
      ),
    );
  }
}
