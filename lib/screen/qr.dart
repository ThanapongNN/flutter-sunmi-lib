import 'dart:convert';

import 'package:atome/screen/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screenshot/screenshot.dart';

class QR extends StatefulWidget {
  final double? amountTotal;

  const QR({Key? key, this.amountTotal}) : super(key: key);

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  static const sunmiChannel = MethodChannel('SunmiEDC');
  String qrBase64 = '';
  double screenHeight = 0;
  double screenWidth = 0;

  ScreenshotController screenshotController = ScreenshotController();

  Widget amount() {
    return Container(
        width: screenWidth,
        padding: EdgeInsets.fromLTRB(
            screenWidth * 0.04, screenHeight * 0.04, screenWidth * 0.02, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Amount", style: TextStyle(fontWeight: FontWeight.w700)),
          Text("THB ${widget.amountTotal}",
              style: TextStyle(fontSize: screenHeight * 0.04))
        ]));
  }

  Widget logo() {
    return SizedBox(
        width: screenWidth * 0.4,
        child: Image.asset("assets/logo/logo.png", fit: BoxFit.cover));
  }

  Widget qrCode() {
    return SizedBox(
        width: screenWidth * 0.6,
        child: Image.asset("assets/qr/qr.png", fit: BoxFit.cover));
  }

  Widget payButton() {
    return Column(children: [
      TextButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Result())),
          child: Container(
              width: screenWidth,
              padding: EdgeInsets.fromLTRB(screenWidth * 0.02,
                  screenHeight * 0.02, screenWidth * 0.02, screenHeight * 0.02),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff006dbe)),
              child: const Text("CHECK TRANSACTION",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700)))),
      TextButton(
          onPressed: () async {
            screenshotController.capture().then((v) async {
              qrBase64 = base64Encode(v!);
              await sunmiChannel
                  .invokeMethod<String>('printQR', {"qrBase64": qrBase64});
            });
          },
          child: Container(
              width: screenWidth,
              padding: EdgeInsets.fromLTRB(screenWidth * 0.02,
                  screenHeight * 0.02, screenWidth * 0.02, screenHeight * 0.02),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: const Color(0xff006dbe), width: 1.0)),
              alignment: Alignment.center,
              child: const Text("PRINT QR",
                  style: TextStyle(
                      color: Color(0xff006dbe), fontWeight: FontWeight.w700))))
    ]);
  }

  Widget body() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(children: [
        Screenshot(
          controller: screenshotController,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [amount(), logo(), qrCode()],
            ),
          ),
        ),
        payButton()
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    screenWidth = queryData.size.width;
    screenHeight = queryData.size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        title: const Text("Branch: Central World",
            style: TextStyle(color: Colors.black87)),
      ),
      body: body(),
    );
  }
}
