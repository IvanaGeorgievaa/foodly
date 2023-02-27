import 'package:flutter/material.dart';
import 'package:foodly_app/controllers/cart_controller.dart';
import 'package:foodly_app/controllers/order_controller.dart';
import 'package:foodly_app/widgets/cart_item.dart';
import 'package:foodly_app/widgets/navbar.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controllers/auth_controller.dart';
import '../custom_text.dart';
import '../pages/order_confirmation_page.dart';

class ShoppingCartWidget extends StatelessWidget {
  UserController userController = UserController.instance;
  CartController cartController = CartController.instance;
  OrdersController ordersController = OrdersController.instance;

  ShoppingCartWidget({super.key});

  Widget _title() {
    return const Center(child: Text('FOODLY'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 197, 47),
        centerTitle: true,
        title: _title(),
        actions: <Widget>[
          IconButton(onPressed: () => Null, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingCartWidget()),
                  ),
              icon: const Icon(Icons.shopping_bag))
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          const Center(
            child: CustomText(
              text: "MY CART",
              size: 24,
              weight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: userController.userModel.value.cart
                .map((cartItem) => CartItemWidget(
                      cartItem: cartItem,
                    ))
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {},
              child: Text(
                "Total:    ${cartController.totalCartPrice.value.toStringAsFixed(2)}мкд",
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 30, right: 30),
              child: cartController.totalCartPrice.value > 0
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderConfirmationPage()));
                        cartController.removeAllCartItems();
                        ordersController.addToOrderCollection();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                      ),
                      child: const Text(
                        "Order Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    )
                  : const SizedBox.shrink())
        ],
      ),
    );
  }
}
