import 'dart:async';

import 'package:atome/screen/receipt.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _Result createState() => _Result();
}

class _Result extends State<Result> {
  late Timer _timer;
  @override
  void initState() {
    handleCountdown();
    super.initState();
  }

  handleCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Receipt()),
          (Route<dynamic> route) => false);
      _timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    return Scaffold(
        body: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Payment Success",
                      style: TextStyle(
                          fontSize: screenHeight * 0.03,
                          color: Colors.green,
                          fontWeight: FontWeight.w800)),
                  SizedBox(height: screenHeight * 0.04),
                  Image.asset("assets/logo/done.png",
                      width: screenWidth * 0.6, fit: BoxFit.cover),
                  SizedBox(height: screenHeight * 0.04),
                  Image.asset("assets/logo/logo.png",
                      width: screenWidth * 0.6, fit: BoxFit.cover)
                ])));
  }
}
