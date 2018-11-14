import 'package:flutter/material.dart';
import './left_image.dart';
import './right_image.dart';
import '../models/todo.dart';

class ImageWidget extends StatelessWidget {
  final List<TodoList> _todoList;

  ImageWidget(this._todoList);
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final firstWidth = 0.6 * screenWidth;
    // final secondWidth = 0.3 * screenWidth;
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpeg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.hardLight,
          ),
        ),
      ),
      padding: EdgeInsets.only(top: 20.0, left: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: firstWidth,
            child: LeftImage(),
          ),
          RightImage(_todoList),
        ],
      ),
    );
  }
}
