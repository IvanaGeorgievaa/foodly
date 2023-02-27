
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodly_app/design_patterns/command/shape.dart';


class ShapeContainer extends StatelessWidget {
  final Shape shape;

  ShapeContainer({super.key, required this.shape}) {
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: shape.height,
              width: shape.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: shape.color,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Text(
                        "Foodly App",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          );
  }
}
