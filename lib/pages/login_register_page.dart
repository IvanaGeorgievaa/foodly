import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Authentication/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Center(child: Text('Foodly Auth')),
    );
  }

  Widget _container() {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.4 - 80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90),
              bottomRight: Radius.circular(20)),
          color: Color.fromARGB(255, 243, 197, 47),
        ),
        child: const Center(
          // ignore: unnecessary_const
          child: Text(
            'FOODLY',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoMono'),
          ),
        ));
  }

  Widget _titleText() {
    return Container(
      alignment: Alignment.topLeft,
      child: const Padding(
        padding: EdgeInsets.only(top: 40.0, left: 30.0),
        child: Text("Hello",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 34,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontFamily: 'RobotoMono')),
      ),
    );
  }

  Widget _underText() {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 30.0, bottom: 30.0),
        child: Text(
            isLogin ? 'Sign into your account' : 'Create your account below!',
            style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                letterSpacing: 1,
                fontFamily: 'RobotoMono')),
      ),
    );
  }

  Widget _entryFieldEmail(
    String title,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
        ),
      ),
    );
  }

  Widget _entryFieldPassword(
    String title,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: TextField(
        obscureText: true,
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
            onPressed: isLogin
                ? signInWithEmailAndPassword
                : createUserWithEmailAndPassword,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 243, 197, 47)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ))),
            child: Text(isLogin ? 'Login' : 'Register')),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(
        isLogin
            ? 'Not registered yet? Create an account'
            : 'Already registered? Log in',
        style: const TextStyle(color: Color.fromARGB(255, 243, 197, 47)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _container(),
            _titleText(),
            _underText(),
            _entryFieldEmail('Email', _controllerEmail),
            _entryFieldPassword('Password', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),
          ],
        ),
      ),
    );
  }
}
