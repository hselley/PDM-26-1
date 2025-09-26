// App0610.dart

import 'package:flutter/material.dart';
import 'App06Main.dart';

Widget buildColumn(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      buildTitleText(),
      SizedBox(height: 20.0,),
      _buildRowOfThree(),
    ],
  );
}

Widget _buildRowOfThree() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _buildExpandedBox("Moose"),
      _buildExpandedBox("Squirrel", flex: 3),
      _buildExpandedBox("Dinosaur", flex: 2),
    ],
  );
}

Widget _buildExpandedBox(String label, {double heigth = 88.0, int flex = 0}) {
  return Expanded(
      flex: flex,
      child: buildRoundedBox(label, height: heigth)
  );
}