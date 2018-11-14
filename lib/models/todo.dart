import 'package:flutter/material.dart';

class TodoList {
  final String task;
  final String location;
  final String time;
  final String category;

  TodoList(
      {@required this.task,
      @required this.location,
      @required this.time,
      @required this.category});
}
