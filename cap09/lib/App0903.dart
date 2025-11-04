// App0903.dart

import 'package:flutter/material.dart';
import 'App09Main.dart';

extension MyHomePageStateExtension on MyHomePageState {
  Animation getAnimation(AnimationController controller) {
    return Tween<double>(begin: 100.0, end: 500.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
    )..addListener(() {
      setState(() {});
    });
  }

  Widget buildPositionedWidget() {
    return Positioned(
      left: 250.0,
      top: animation.value,
      child: Icon(Icons.android_outlined, size: 120.0,)
    );
  }
}