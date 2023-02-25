import 'package:flutter/material.dart';
import 'package:foodly_app/pages/home_page.dart';

import '../controllers/product_controller.dart';

class OrderConfirmationPage extends StatelessWidget {
  ProducsController producsController = ProducsController.instance;
  OrderConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 197, 47),
        title: const Text("Order Confirmation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "Your order has been confirmed!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 243, 197, 47)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePage(main_list: producsController.products)));
              },
              child: const Text(
                "Go Back",
                style: TextStyle(
                    backgroundColor: Color.fromARGB(255, 243, 197, 47)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
