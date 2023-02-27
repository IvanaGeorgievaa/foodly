import 'dart:math';
import 'dart:ui';

import 'package:foodly_app/design_patterns/command/command.dart';
import 'package:foodly_app/design_patterns/command/shape.dart';

class ChangeWidthCommand implements Command {
 late Shape shape;
  late double previousWidth;

  ChangeWidthCommand(this.shape) {
    previousWidth = shape.width;
  }

  @override 
  void execute() {
    shape.width = Random().nextInt(100).toDouble() + 70;
  }

  @override 
  String getTitle() {
    return 'Change width';
  }

  @override 
  void undo() {
    shape.width = previousWidth;
  }

}