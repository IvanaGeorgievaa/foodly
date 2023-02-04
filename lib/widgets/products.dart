import 'package:flutter/material.dart';
import 'package:foodly_app/controllers/product_controller.dart';
import 'package:foodly_app/models/product.dart';
import 'package:foodly_app/widgets/single_product.dart';
import 'package:get/get.dart';

class ProductsWidget extends StatelessWidget {
  ProducsController producsController = ProducsController.instance;

  ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          children: producsController.products.map((ProductModel product) {
            return SingleProductWidget(
              product: product,
            );
          }).toList()),
    );
  }
}
