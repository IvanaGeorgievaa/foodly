import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodly_app/Authentication/auth.dart';
import 'package:foodly_app/pages/home_page.dart';
import 'package:foodly_app/widgets/shopping_cart.dart';

import '../controllers/product_controller.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);
  ProducsController producsController = ProducsController.instance;

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userEmail() {
    return Text(
      user?.email ?? 'User email',
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('User Email:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: _userEmail(),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg?resize=768,512",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1541140134513-85a161dc4a00?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3JleSUyMGJhY2tncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Products'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage(main_list: producsController.products)))),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart items'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingCartWidget()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Our location'),
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('Account Details'),
            onTap: () => null,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 210),
            child: ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Log Out'),
              onTap: signOut,
            ),
          ),
        ],
      ),
    );
  }
}
