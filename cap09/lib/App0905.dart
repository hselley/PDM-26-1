// App0905.dart

import 'package:flutter/material.dart';
import 'App09Main.dart';
import 'dart:math';

extension MyHomePageStateExtension on MyHomePageState {
  Animation getAnimation(AnimationController controller) {
    return Tween<double>(begin: 0.0, end: 400.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }
  
  Widget buildPositionedWidget() {
    double newValue = animation.value;
    int value = animation.value.toInt();
    return Positioned(
        left: 15*sqrt(newValue),
        top: newValue,
        child: Icon(
          Icons.android,
          size: 80,
          color: Color.fromRGBO(value, 255-value, 120, 0.75),
        )
    );
  }
}