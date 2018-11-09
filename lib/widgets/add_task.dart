import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: "Create a new Todo",
      child: new Icon(Icons.create),
      onPressed: () {
        Navigator.of(context).pushNamed("createNewTask");
      },
    );
  }
}
