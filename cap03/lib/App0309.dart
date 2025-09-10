import 'package:flutter/material.dart';

main() => runApp(App0309());

class App0309 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first image"),
        ),
        body: Center(
          child: Image.asset("assets/LogoAndroid.png")
        ),
      ),
    );
  }
}