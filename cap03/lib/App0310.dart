import 'package:flutter/material.dart';

main() => runApp(App0310());

class App0310 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Game Collection"),),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Center(child: Text("Gears of War", textScaler: TextScaler.linear(2),)),
              Image.asset('assets/gow.jpg'),
              SizedBox(height: 40.0,),
              Center(child: Text("Last of Us", textScaler: TextScaler.linear(2),)),
              Image.asset('assets/lou.png'),
              SizedBox(height: 40.0,),
              Center(child: Text("Mario Galaxy", textScaler: TextScaler.linear(2),)),
              Image.asset('assets/galaxy.jpg'),
              SizedBox(height: 40.0,),
              Center(child: Text("Sonic Adventure", textScaler: TextScaler.linear(2),)),
              Image.asset('assets/sonic.png'),
              SizedBox(height: 40.0,),
            ],
          ),
        )
      ),
    );
  }
}