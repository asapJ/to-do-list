import 'package:flutter/material.dart';
import '../models/todo.dart';

class RightImage extends StatelessWidget {
  final List<TodoList> _todoList;
  RightImage(this._todoList);
  final TextStyle _topStyle =
      new TextStyle(fontSize: 30.0, color: Colors.white);
  final TextStyle _smallStyle =
      new TextStyle(fontSize: 13.0, color: Colors.white);
  int personal;
  int business;

  void getCatgories() {
    for (var i = 0; i < _todoList.length; i++) {
      if (_todoList[i].category == "personal") {
        personal++;
      } else {
        business++;
      }
    }
  }

  Widget build(BuildContext context) {
    print(_todoList);
    return Expanded(
      child: Container(
        color: Colors.black.withOpacity(0.3),
        child: Column(
          children: <Widget>[
            _buildCategory(),
            SizedBox(
              height: 55.0,
            ),
            Text(
              "34% done",
              style: _smallStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "0",
                style: _topStyle,
              ),
              Text("Personal", style: _smallStyle),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                "0",
                style: _topStyle,
              ),
              Text(
                "Work",
                style: _smallStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
