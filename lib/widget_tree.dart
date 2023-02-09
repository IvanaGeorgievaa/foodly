import 'package:flutter/material.dart';
import 'package:foodly_app/Authentication/auth.dart';
import 'package:foodly_app/pages/home_page.dart';
import 'package:foodly_app/pages/login_register_page.dart';

import 'controllers/product_controller.dart';

class WidgetTree extends StatefulWidget {
   WidgetTree({Key? key}) : super(key: key);


  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
    ProducsController producsController = ProducsController.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage(main_list: producsController.products,);
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
