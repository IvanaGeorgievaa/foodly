import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodly_app/controllers/auth_controller.dart';
import 'package:foodly_app/controllers/cart_controller.dart';
import 'package:foodly_app/controllers/product_controller.dart';
import 'package:foodly_app/widget_tree.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<FirebaseApp> initialization = Firebase.initializeApp();
  await initialization.then((value) {
    Get.lazyPut(()=>UserController());
    Get.put(ProducsController());
    Get.put(CartController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:  WidgetTree(),
    );
  }
}
