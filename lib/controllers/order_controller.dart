import 'package:foodly_app/controllers/auth_controller.dart';
import 'package:foodly_app/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class OrdersController extends GetxController {
  static OrdersController instance = Get.find();
  String collection = "orders";
  UserController userController = UserController.instance;
  CartController cartController = CartController.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onReady() {
    super.onReady();
  }

  addToOrderCollection() {
    String id = Uuid().v1();
    firebaseFirestore.collection(collection).doc(id).set({
      "orderId": id,
      "clientEmail": userController.userModel.value.email,
      "orderItems": userController.userModel.value.cartItemsToJson(),
      "totalAmount": cartController.totalCartPrice.value.toStringAsFixed(2),
      "createdAt": DateTime.now(),
    });
  }
}
