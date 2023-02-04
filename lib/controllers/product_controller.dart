import 'dart:async';
import 'package:get/get.dart';
import 'package:foodly_app/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProducsController extends GetxController {
  static ProducsController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String collection = "products";
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
  }

  Stream<List<ProductModel>> getAllProducts() =>
      firebaseFirestore.collection(collection).snapshots().map((query) =>
          query.docs.map((item) => ProductModel.fromMap(item.data())).toList());
}
