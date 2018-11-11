import 'package:flutter/material.dart';

class TodoContent extends StatelessWidget {
  final List<Map<String, dynamic>> _todoList;
  final List<Map<String, dynamic>> _completedTask = [];
  final Function _insertTask;
  TodoContent(this._todoList, this._insertTask);

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
            title: new Text("${_todoList[index]["task"]}"),
            subtitle: new Text("${_todoList[index]["location"]}"),
            trailing: new Text("${_todoList[index]["time"]}"),
            leading: CircleAvatar(child: Icon(Icons.home)),
          ),
          onDismissed: (direction) {
            deleteTask(index, context);
          },
        );
      },
    );
  }

  void deleteTask(int index, BuildContext context) {
    _todoList.removeAt(index);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Task deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            _insertTask();
          },
        ),
      ),
    );
  }
}
