// App0606.dart

import 'package:flutter/material.dart';
import 'App06Main.dart';

Widget buildColumn(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      buildTitleText(),
      SizedBox(height: 25.0,),
      _buildCaptionedRow(),
    ],
  );
}

Widget _buildCaptionedRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildCaptionedItem("Cat", caption: "Meow"),
      _buildCaptionedItem("Dog", caption: "Woof"),
      _buildCaptionedItem("Ape", caption: "Chatter"),
    ],
  );
}

Widget _buildCaptionedItem(String label, {required String caption}) {
  return Column(
    children: [
      buildRoundedBox(label),
      SizedBox(height: 15.0,),
      Text(caption, textScaler: TextScaler.linear(1.25),)
    ],
  );
}