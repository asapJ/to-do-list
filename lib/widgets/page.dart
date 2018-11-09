import 'package:flutter/material.dart';
import './image_widget.dart';
import './todo_content.dart';
class HomePage extends StatelessWidget {

  final List<Map<String, dynamic>> _todoList;
  final Function insertTask;
  HomePage(this._todoList, this.insertTask);

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ImageWidget(),
          Text("Todos"),
          Expanded(
            child: TodoContent(_todoList, insertTask)),
        ],
      ),
    );
  }
}
