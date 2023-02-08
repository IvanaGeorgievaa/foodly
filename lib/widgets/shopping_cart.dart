import 'package:flutter/material.dart';
import 'package:foodly_app/controllers/cart_controller.dart';
import 'package:foodly_app/widgets/cart_item.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controllers/auth_controller.dart';
import '../custom_text.dart';

class ShoppingCartWidget extends StatelessWidget {
  UserController userController = UserController.instance;
  CartController cartController = CartController.instance;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
             Center(
              child: CustomText(
                text: "Shopping Cart ${userController.userModel.value.email}",
                size: 24,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(() => Column(
                  children: userController.userModel.value.cart
                      .map((cartItem) => CartItemWidget(
                            cartItem: cartItem,
                          ))
                      .toList(),
                )),
          ],
        ),
        Positioned(
            bottom: 30,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8),
                child: Obx(
                  () => TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {},
                    child:  Text("Pay (\$${cartController.totalCartPrice.value.toStringAsFixed(2)})"),
                  ),
                )))
      ],
    );
  }
}
