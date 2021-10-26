// ignore_for_file: sized_box_for_whitespace

import 'package:atome/screen/order.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode usernameNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    Widget headerBar() {
      return Container(
          width: screenWidth * 0.35,
          padding: EdgeInsets.fromLTRB(
              screenWidth * 0.02, screenHeight * 0.02, screenWidth * 0.02, 0),
          child: Image.asset("assets/logo/logo.png", fit: BoxFit.cover));
    }

    Widget loginForm() {
      return Container(
          padding: EdgeInsets.fromLTRB(
              screenWidth * 0.02, screenHeight * 0.02, screenWidth * 0.02, 0),
          child: Column(children: [
            TextFormField(
                controller: usernameController,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.name,
                focusNode: usernameNode,
                decoration: InputDecoration(
                    hintText: 'User name',
                    suffixStyle: const TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFF9F02)),
                        borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFF9F02)),
                        borderRadius: BorderRadius.circular(8)))),
            const SizedBox(height: 20),
            TextFormField(
                controller: passwordController,
                obscureText: true,
                textAlign: TextAlign.left,
                focusNode: passwordNode,
                decoration: InputDecoration(
                    hintText: 'Password',
                    suffixStyle: const TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFF9F02)),
                        borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFFF9F02)),
                        borderRadius: BorderRadius.circular(8)))),
          ]));
    }

    Widget loginButton() {
      return TextButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Order())),
          child: Container(
              width: screenWidth,
              padding: EdgeInsets.fromLTRB(screenWidth * 0.02,
                  screenHeight * 0.02, screenWidth * 0.02, screenHeight * 0.02),
              alignment: Alignment.center,
              color: const Color(0xfff2fc62),
              child: const Text("Login",
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w700))));
    }

    Widget body() {
      return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [headerBar(), loginForm(), loginButton()]));
    }

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(), child: body())));
  }
}
