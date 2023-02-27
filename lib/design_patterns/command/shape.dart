import 'dart:ui';

import 'package:flutter/material.dart';

class Shape {
  late Color color;
  late double height;
  late double width;

  Shape.initial() {
    color=Color.fromARGB(144, 243, 197, 70);
    height=150.0;
    width=150.0;
  }
}