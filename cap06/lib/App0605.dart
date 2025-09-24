// App0605.dart

import 'package:flutter/material.dart';
import 'App06Main.dart';

Widget buildColumn(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      buildTitleText(),
      SizedBox(height: 50.0,),
      _buildRowOfThree(),
    ],
  );
}

Widget _buildRowOfThree() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildRoundedBox("Cat"),
      SizedBox(width: 50,),
      buildRoundedBox("Dog"),
      buildRoundedBox("Ape"),
      buildRoundedBox("Cat"),
      buildRoundedBox("Dog"),
      buildRoundedBox("Ape"),
    ],
  );
}