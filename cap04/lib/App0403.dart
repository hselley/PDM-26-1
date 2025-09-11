import 'package:flutter/material.dart';

main() => runApp(App0401());

class App0401 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(child: Text(funcion("Hola mundo"))),
      ),
    );
  }

  funcion(s) => "*** $s ***";
}