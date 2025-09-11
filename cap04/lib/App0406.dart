import 'package:flutter/material.dart';

final List<String> entries = <String>['A', 'B', 'C', 'D'];
final List<int> colorCodes = <int>[600, 500, 100];

main() => runApp(App0506());

class App0506 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ListView builder demo"),),
        body: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150,
                color: Colors.amber[colorCodes[index]],
                child: Center(
                  child: Text('Entry ${entries[index]}'),
                ),
              );
            }
        ),
      ),
    );
  }
}
