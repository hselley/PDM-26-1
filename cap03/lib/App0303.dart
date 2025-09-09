import 'package:flutter/material.dart';

void main() => runApp(App0303());

class App0303 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first Scaffold"),
          elevation: 100,
        ),
        body: Center(
          child: Text("Hello world!")
        ),
        drawer: Drawer(
          child: Center(
            child: Text("I'm a drawer"),
          ),
        ),
      ),
    );
  }
}