// Appp0705.dart

import 'package:cap7/App0701.dart';
import 'package:flutter/material.dart';

void main() => runApp(App0705());

class App0705 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(),);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum Gender { Female, Male, Other }

String show(Gender gender) => gender.toString().replaceAll("Gender.", "");

class _MyHomePageState extends State<MyHomePage> {
  String _messageToUser = "";
  Gender? _genderRadioValue;

  // Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Are you compatible?"),),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            _buildGenderRadio(),
            _buildResultArea()
          ],
        ),
      ),
    );
  }

  Widget _buildGenderRadio() {
    return Row(
      children: [
        Text("Female"),
        Radio(value: Gender.Female, groupValue: _genderRadioValue, onChanged: _updateGenderRadio,),
        SizedBox(width: 25,),
        Text("Male"),
        Radio(value: Gender.Male, groupValue: _genderRadioValue, onChanged: _updateGenderRadio,),
        SizedBox(width: 25,),
        Text("Other"),
        Radio(value: Gender.Other, groupValue: _genderRadioValue, onChanged: _updateGenderRadio,),
        SizedBox(width: 25,),
      ],
    );
  }

  Widget _buildResultArea() {
    return Row(
      children: [
        ElevatedButton(
            onPressed: _genderRadioValue != null ? _updateResults : null,
            child: Text("Submit")
        )
      ],
    );
  }

  // Actions
  void _updateGenderRadio(Gender? newValue) {
    setState(() {
      _genderRadioValue = newValue;
    });
  }

  void _updateResults() {
    setState(() {
      _messageToUser = "You selected ${show(_genderRadioValue!)}";
    });
  }

}