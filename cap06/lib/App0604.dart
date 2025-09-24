// App0604.dart

import 'package:flutter/material.dart';

void main() => runApp(App0604());

class App0604 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Material(
          color: Colors.grey[50],
          child: Container(
            color: Colors.grey[500],
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(40.0),
            child: Container(
              color: Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }
}