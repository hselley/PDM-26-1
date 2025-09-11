import 'package:flutter/material.dart';

void main() => runApp(App0404());

class App0404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(funcion("Hola de nuevo")),
              Text(funcion("Adios mundo")),
              Text("7! = ${factorial(7)}"),
              Text("17! = ${factorial(17)}"),
            ],
          ),
        ),
      ),
    );
  }
}

funcion(x) => "*** $x ***";

String factorial(int n) {
  double f=1;
  for(int i=1; i<=n; i++) {
    f*=i;
  }
  return f.toString();
}