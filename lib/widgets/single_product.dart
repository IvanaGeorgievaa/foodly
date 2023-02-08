import 'package:flutter/material.dart';
import 'package:foodly_app/controllers/cart_controller.dart';

import '../custom_text.dart';
import '../models/product.dart';
import '../pages/details_page.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel product;
  CartController cartController = CartController.instance;

   SingleProductWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(product: product))),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    offset: const Offset(3, 2),
                    blurRadius: 7)
              ]),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                  child: Text(
                    product.name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
<<<<<<< HEAD
                IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      cartController.addProductToCart(product);
                    }),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, bottom: 20, right: 10),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: Image.network(product.image, width: 120)),
=======
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    "category: " "${product.category}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
>>>>>>> 62efa6722692f7b1e1960f4a5e4c74494bfba18c
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 243, 197, 47),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      onPressed: () => Null,
                      child: CustomText(
                        text: "${product.price} ден",
                        size: 16,
                        weight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () {}),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, bottom: 20, right: 10),
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        child: Image.network(product.image, width: 120)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
