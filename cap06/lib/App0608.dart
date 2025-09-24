// App0608.dart

import 'package:flutter/material.dart';
import 'App06Main.dart';

Widget buildColumn(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      buildTitleText(),
      SizedBox(height: 20.0,),
      _buildRowOfFive(),
    ],
  );
}

Widget _buildRowOfFive() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      _buildExpandedBox("Cat"),
      SizedBox(width: 5.0,),
      _buildExpandedBox("Dog"),
      SizedBox(width: 5.0,),
      _buildExpandedBox("Ape"),
      SizedBox(width: 5.0,),
      _buildExpandedBox("Ox"),
      SizedBox(width: 5.0,),
      _buildExpandedBox("Gnu"),
    ],
  );
}

Widget _buildExpandedBox(String label, {double height = 88.0}) {
  return Expanded(
      child: buildRoundedBox(label, height: height)
  );
}