import 'dart:collection';

import 'command.dart';

class CommandHistory {
  final ListQueue<Command> _commandList = ListQueue<Command>();
  void add(Command command) {
    _commandList.add(command);
  }

  void undo() {
    if(_commandList.isNotEmpty) {
      var command = _commandList.removeLast();
      command.undo();
    }
  }

  bool isEmpty() {
    return _commandList.isEmpty;
  }
}