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
          _todoList.length == 0
              ? Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 200.0),
                    child: Column(
                      children: <Widget>[
                        Text("No Todo Has been Added"),
                        Text("Click on the + Icon to add New Todo"),
                      ],
                    ),
                  ),
                )
              : Expanded(child: TodoContent(_todoList, insertTask)),
        ],
      ),
    );
  }
}
