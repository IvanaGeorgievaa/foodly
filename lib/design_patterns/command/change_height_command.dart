import 'dart:math';
import 'dart:ui';

import 'package:foodly_app/design_patterns/command/command.dart';
import 'package:foodly_app/design_patterns/command/shape.dart';

class ChangeHeightCommand implements Command {
 late Shape shape;
  late double previousHeight;

  ChangeHeightCommand(this.shape) {
    previousHeight = shape.height;
  }

  @override 
  void execute() {
    shape.height = Random().nextInt(100).toDouble() + 70;
  }

  @override 
  String getTitle() {
    return 'Change height';
  }

  @override 
  void undo() {
    shape.height = previousHeight;
  }

}