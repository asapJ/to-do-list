import 'package:flutter/material.dart';
import './image_widget.dart';
import './todo_content.dart';
import '../models/todo.dart';

class HomePage extends StatelessWidget {
  final List<TodoList> _todoList;
  final Function _deleteTask;
  final TextStyle _todoStyle = TextStyle(fontSize: 20.0);
  HomePage(this._todoList, this._deleteTask);

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ImageWidget(_todoList),
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Todos",
                  style: _todoStyle,
                ),
                Container(
                  margin: EdgeInsets.only(right: 15.0),
                  child: RaisedButton(
                    onPressed: () {
                      print("Done here");
                    },
                    child: Text("Done"),
                  ),
                ),
              ],
            ),
          ),
          _todoList.length == 0
              ? Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 120.0),
                    child: Column(
                      children: <Widget>[
                        Text("No Todo Has been Added"),
                        Text("Click on the + Icon to add New Todo"),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: TodoContent(_todoList, _deleteTask),
                ),
        ],
      ),
    );
  }
}
