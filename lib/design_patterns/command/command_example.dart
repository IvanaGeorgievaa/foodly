import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodly_app/design_patterns/command/command.dart';
import 'package:foodly_app/design_patterns/command/command_history.dart';
import 'package:foodly_app/design_patterns/command/shape_container.dart';

import '../../custom_text.dart';
import '../../widgets/shopping_cart.dart';
import 'change_color_command.dart';
import 'change_height_command.dart';
import 'change_width_command.dart';
import 'shape.dart';

class CommandExample extends StatefulWidget {
  @override 
  _CommandExampleState createState() => _CommandExampleState();
}

class _CommandExampleState extends State<CommandExample> {
  final CommandHistory _commandHistory = CommandHistory();
  final Shape _shape = Shape.initial();

  void _changeColor() {
    var command = ChangeColorCommand(_shape);
    _executeCommand(command);
  }

  void _changeHeight() {
    var command = ChangeHeightCommand(_shape);
    _executeCommand(command);
  }

  void _changeWidth() {
    var command = ChangeWidthCommand(_shape);
    _executeCommand(command);
  }

  void _executeCommand(Command command){
    setState(() {
      command.execute();
      _commandHistory.add(command);
    });
  }

  void _undo() {
    setState(() {
      _commandHistory.undo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 197, 47),
        centerTitle: true,
        title: Text("FOODLY"),
        actions: <Widget>[
          IconButton(onPressed: () => Null, icon: const Icon(Icons.search)),
         IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingCartWidget()),
                  ),
              icon: const Icon(Icons.shopping_bag))
        ],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 100.0,),
          ShapeContainer(shape: _shape),
            const SizedBox(height: 20.0,),
            ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 243, 197, 47),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      onPressed: _changeColor,
                      child: CustomText(
                        text: "Change color",
                        size: 16,
                        weight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 243, 197, 47),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      onPressed: _changeWidth,
                      child: CustomText(
                        text: "Change width",
                        size: 16,
                        weight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 243, 197, 47),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      onPressed: _changeHeight,
                      child: CustomText(
                        text: "Change height",
                        size: 16,
                        weight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
            Divider(),
        ],
      ),
    );
  }}