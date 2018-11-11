import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final Function _updatePage;
  AddTask(this._updatePage);
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: "Create a new Todo",
      child: new Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed("createNewTask").then(
          (value) {
            value == null ? value = [] : _updatePage(value);
          },
        );
      },
    );
  }
}
