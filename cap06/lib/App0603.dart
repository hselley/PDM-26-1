// App0603.dart

import 'package:flutter/material.dart';

void main() => runApp(App0603());

class App0603 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
       color: Colors.grey[50],
        child: Container(
          color: Colors.grey[500],
          child: Container(
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}