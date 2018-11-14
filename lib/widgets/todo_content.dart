import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/todo.dart';

class TodoContent extends StatefulWidget {
  final List<TodoList> _todoList;
  final List<TodoList> _completedTask = [];
  final Function _deleteTask;
  final List<TodoList> _deletedItem = [];

  TodoContent(this._todoList, this._deleteTask);

  @override
  _TodoContentState createState() => _TodoContentState();
}

class _TodoContentState extends State<TodoContent> {
  @override
  Widget build(BuildContext context) {
    var _todoList = this.widget._todoList;
    var _deleteTask = this.widget._deleteTask;
    var _deletedItem = this.widget._deletedItem;
    return ListView.builder(
      itemCount: _todoList.length,
      itemBuilder: (BuildContext context, int index) {
        String _item = index.toString();
        return Dismissible(
          background: Container(color: Colors.blue),
          direction: DismissDirection.startToEnd,
          key: Key("$_todoList[index]['task']$_item"),
          onDismissed: (direction) {
            print(index);
            setState(() {
              _todoList.removeAt(index);
              // _deleteTask(index, context, _deletedItem);
            });
          },
          child: ListTile(
            title: new Text("${_todoList[index].task}"),
            subtitle: new Text("${_todoList[index].location}"),
            trailing: new Text("${_todoList[index].time}"),
            leading: CircleAvatar(child: Icon(Icons.home)),
          ),
        );
      },
    );
  }
}
