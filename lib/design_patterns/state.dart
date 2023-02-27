import 'package:foodly_app/design_patterns/state_base.dart';

class StateClass extends StateBase {
  static final StateClass _instance = StateClass._internal();

  factory StateClass() {
    return _instance;
  }

  StateClass._internal() {
    initialText = "Initial text";
    stateText = initialText;
    print (stateText);
  }
}