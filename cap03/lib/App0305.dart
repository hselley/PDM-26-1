import 'package:flutter/cupertino.dart';

void main() => runApp(App0305());

class App0305 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(),
          child: Center(child: Text("Hello world!"))
      ),
    );
  }
}