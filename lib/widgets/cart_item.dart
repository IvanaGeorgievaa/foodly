import 'package:flutter/material.dart';
import 'package:foodly_app/controllers/cart_controller.dart';

import '../custom_text.dart';
import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  CartController cartController = CartController.instance;

  final CartItemModel cartItem;

  CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 20, right: 20),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 20),
                    child: Text(
                      cartItem.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 100, left: 30),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: Image.network(cartItem.image, width: 110)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Material(
                          child: IconButton(
                              icon: const Icon(Icons.chevron_left),
                              onPressed: () {
                                cartController.decreaseQuantity(cartItem);
                              })),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: cartItem.quantity.toString(),
                          color: Colors.black,
                          size: 24,
                          weight: FontWeight.bold,
                        ),
                      ),
                      Material(
                          child: IconButton(
                              icon: const Icon(Icons.chevron_right),
                              onPressed: () {
                                cartController.increaseQuantity(cartItem);
                              })),
                    ],
                  ),
                ),
              ],
            ),
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 20),
                child: CustomText(
                  text: "${cartItem.cost / cartItem.quantity}мкд",
                  color: Colors.grey,
                  size: 15,
                  weight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomText(
                  text: "${cartItem.cost}мкд",
                  color: Colors.black,
                  size: 15,
                  weight: FontWeight.bold,
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
