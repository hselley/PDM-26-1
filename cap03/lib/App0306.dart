import 'package:flutter/material.dart';

void main() => runApp(App0306());

class App0306 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Adding widgets"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Hello world",
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.blue),
            ),
            Text("Goodbye cruel world",
                style: TextStyle(
                    fontFamily: "sans serif",
                    fontSize: 38,
                color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}