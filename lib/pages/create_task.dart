import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  final _todoList;
  CreateTask(this._todoList);
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  Map<String, dynamic> _formData = {
    "task": "",
    "location": "",
    "time": "10:00"
  };
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String task = "";
  String location = "";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Todo"),
      ),
      body: Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            _buildTaskField(),
            _buildLocationField(),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Task",
      ),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return "Enter a Task";
        }
      },
      onSaved: (String value) {
        _formData["task"] = value;
      },
    );
  }

  Widget _buildLocationField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Location",
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Enter the Location";
        }
      },
      onSaved: (String value) {
        _formData["location"] = value;
      },
    );
  }

  Widget _buildSaveButton() {
    return RaisedButton(
      child: Text("Add New Task"),
      onPressed: () {
        if (!_formKey.currentState.validate()) {
          return;
        }
        _formKey.currentState.save();
        widget._todoList.add(_formData);
        Navigator.pop(context, widget._todoList);
      },
    );
  }
}
