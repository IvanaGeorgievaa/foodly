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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            cartItem.image,
            width: 80,
          ),
        ),
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
                padding: EdgeInsets.only(left: 14),
                child: CustomText(
                  text: cartItem.name,
                  color: Colors.white,
                  size: 24,
                  weight: FontWeight.bold,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    color: Colors.white,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                ),
                Material(
                    child:IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () {
                      cartController.increaseQuantity(cartItem);
                    })),
              ],
            )
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CustomText(
            text: "\$${cartItem.cost}",
            size: 22,
            weight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
