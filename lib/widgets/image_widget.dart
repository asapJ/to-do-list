import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  TextStyle topStyle = new TextStyle(fontSize: 40.0, color: Colors.white);
  Widget build(BuildContext context) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.menu,
                color: Colors.white,
              ),
              Text(
                "Your",
                style: topStyle,
              ),
              Text(
                "Things",
                style: topStyle,
              ),
            ],
          ),
          SizedBox(
            width: 100.0,
          ),
          Expanded(
            child: Container(
              color: Colors.black.withOpacity(0.3),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("24"),
                          Text("Personal"),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("15"),
                          Text("Business"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Hello world"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
