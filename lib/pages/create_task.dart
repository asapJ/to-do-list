import 'package:flutter/material.dart';
import '../models/todo.dart';

class CreateTask extends StatefulWidget {
  final List<DropdownMenuItem<String>> categories = [];
  final List<TodoList> _todoList;
  CreateTask(this._todoList);
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  Map<String, dynamic> _formData = {
    "task": "",
    "location": "",
    "time": '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}',
    "category": "Business"
  };

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String task = "";

  String location = "";

  String _value = "";

  List<String> values = [];
  @override
  void initState() {
    super.initState();
    values.addAll(["One", "Two", "Three"]);
    _value = values.elementAt(0);
  }

  void newValue(String value) {
    setState(() {
      print(value);
      _value = value;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Todo"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(5.0),
                  child: new ListView(
            children: <Widget>[
              _buildTaskField(),
              _buildLocationField(),
              _buildSaveButton(),
              _buildDropDown(),
            ],
          ),
        ),
      ),
    );
  }

  //Building the various widgets on the page
  Widget _buildDropDown() {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: new DropdownButton(
        isExpanded: true,
        items: values.map((String value) {
          return DropdownMenuItem(
            child: new Text(value),
          );
        }).toList(),
        onChanged: (value) {
          print("First value $value");
          newValue(value);
        },
        hint: new Text("Select a category"),
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
        widget._todoList.add(TodoList(
            task: _formData["task"],
            location: _formData["location"],
            time: _formData["time"],
            category: _formData["category"]));
        Navigator.pop(context, widget._todoList);
      },
    );
  }
}
