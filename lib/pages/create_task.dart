import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Todo"),
        
      ),
      body: Container(
        child: Center(
          child: Text("On a new Page, here we are"),
        ),
      ),
    );
  }
}
