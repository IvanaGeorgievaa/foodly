import 'dart:math';
import 'dart:ui';

import 'package:foodly_app/design_patterns/command/command.dart';
import 'package:foodly_app/design_patterns/command/shape.dart';

class ChangeColorCommand implements Command {
 late Shape shape;
  late Color previousColor;

  ChangeColorCommand(this.shape) {
    previousColor = shape.color;
  }

  @override 
  void execute() {
    shape.color = Color.fromRGBO(
      Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1.0
    );
  }

  @override 
  String getTitle() {
    return 'Change color';
  }

  @override 
  void undo() {
    shape.color = previousColor;
  }
}