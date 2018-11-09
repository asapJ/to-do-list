import 'package:flutter/material.dart';

class TodoContent extends StatelessWidget {
  final List<Map<String, dynamic>> _todoList;
  final Function _insertTask;
  TodoContent(this._todoList, this._insertTask);

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _todoList.length,
      itemBuilder: (BuildContext context, int index) {
        String item = index.toString();
        return Dismissible(
          background: Container(color: Colors.blue),
          direction: DismissDirection.startToEnd,
          key: Key(item),
          child: ListTile(
            title: new Text("${_todoList[index]["Task"]}"),
            subtitle: new Text("${_todoList[index]["Location"]}"),
            trailing: new Text("${_todoList[index]["Time"]}"),
            leading: CircleAvatar(child: Icon(Icons.create)),
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
