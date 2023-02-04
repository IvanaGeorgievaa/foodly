import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodly_app/Authentication/auth.dart';
import 'package:foodly_app/widgets/navbar.dart';
import 'package:foodly_app/widgets/products.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
              onPressed: () => Null, icon: const Icon(Icons.shopping_bag))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ProductsWidget(), _signOutButton()],
        ),
      ),
    );
  }
}
