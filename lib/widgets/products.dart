import 'package:flutter/material.dart';
import 'package:foodly_app/controllers/product_controller.dart';
import 'package:foodly_app/models/product.dart';
import 'package:foodly_app/widgets/single_product.dart';
import 'package:get/get.dart';

class ProductsWidget extends StatelessWidget {
  ProducsController producsController = ProducsController.instance;
  final List<ProductModel> products;

  ProductsWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          children: products.map((ProductModel product) {
            return SingleProductWidget(
              product: product,
            );
          }).toList()),
    );
  }
}
