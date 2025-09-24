// App0607.dart

import 'package:flutter/material.dart';
import 'App06Main.dart';

Widget buildColumn(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      buildTitleText(),
      SizedBox(height: 20.0,),
      _buildColumnWithinRow(),
    ],
  );
}

Widget _buildColumnWithinRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      buildRoundedBox("Cat"),
      SizedBox(width: 20.0,),
      buildRoundedBox("Dog"),
      SizedBox(width: 20.0,),
      Column(
        children: [
          buildRoundedBox("Big ox", height: 100.0),
          SizedBox(height: 5.0,),
          buildRoundedBox("Small ox", height: 35.0)
        ],
      ),
    ],
  );
}
