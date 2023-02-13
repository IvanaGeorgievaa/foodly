import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodly_app/Authentication/auth.dart';
import 'package:foodly_app/widgets/navbar.dart';
import 'package:foodly_app/widgets/products.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../controllers/product_controller.dart';
import '../models/product.dart';
import '../widgets/shopping_cart.dart';

class HomePage extends StatefulWidget {
  List<ProductModel> main_list;

  HomePage({Key? key, required this.main_list}) : super(key: key) {}

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProducsController producsController = ProducsController.instance;

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Center(child: Text('FOODLY'));
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 250.0, top: 20.0),
      child: FloatingActionButton(
        onPressed: signOut,
        backgroundColor: const Color.fromARGB(255, 243, 197, 47),
        child: const Icon(Icons.login_rounded),
      ),
    );
  }

  late List<ProductModel> d_list = producsController.products;

  void updateList(String value) {
    setState(() {
      d_list = widget.main_list
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void updateListbyCategory(String category) {
    setState(() {
      d_list = widget.main_list
          .where((element) =>
              element.category.toLowerCase().contains(category.toLowerCase()))
          .toList();
    });
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: GestureDetector(
                      onTap: () => updateListbyCategory('Breakfast'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(144, 243, 197, 70),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Breakfast",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: GestureDetector(
                      onTap: () => updateListbyCategory('Lunch'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(144, 243, 197, 70),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Lunch",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: GestureDetector(
                      onTap: () => updateListbyCategory('Dinner'),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(144, 243, 197, 70),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Dinner",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(144, 243, 197, 70),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  hintText: "eg. Chicken Gyro",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.purple),
            ),
            ProductsWidget(
              products: d_list,
            ),
            _signOutButton()
          ],
        ),
      ),
    );
  }
}
