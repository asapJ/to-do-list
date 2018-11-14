import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoContent extends StatelessWidget {
  final List<TodoList> _todoList;
  final List<TodoList> _completedTask = [];
  final Function _deleteTask;
  final List<TodoList> _deletedItem = [];

  TodoContent(this._todoList, this._deleteTask);

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _todoList.length,
      itemBuilder: (BuildContext context, int index) {
        String _item = index.toString();
        return Dismissible(
          background: Container(color: Colors.blue),
          direction: DismissDirection.startToEnd,
          key: Key("$_todoList[index]['task']$_item"),
          child: ListTile(
            title: new Text("${_todoList[index].task}"),
            subtitle: new Text("${_todoList[index].location}"),
            trailing: new Text("${_todoList[index].time}"),
            leading: CircleAvatar(child: Icon(Icons.home)),
          ),
          onDismissed: (direction) {
            print(index);
            _deleteTask(index, context, _deletedItem);
          },
        );
      },
    );
  }

}
