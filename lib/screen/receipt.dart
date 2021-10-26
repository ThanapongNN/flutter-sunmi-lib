import 'package:atome/screen/order.dart';
import 'package:flutter/material.dart';

class Receipt extends StatelessWidget {
  const Receipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    Widget header() {
      return Container(
        width: screenWidth,
        padding: EdgeInsets.fromLTRB(screenWidth * 0.1, screenHeight * 0.02,
            screenWidth * 0.1, screenHeight * 0.02),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.asset("assets/logo/logo.png",
              width: screenWidth * 0.6, fit: BoxFit.cover),
          Text("GBPrime Pay (Central World - Bangkok,Thailand",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: screenHeight * 0.02, fontWeight: FontWeight.w800)),
          SizedBox(height: screenHeight * 0.01),
          Text("999/9 Rama 1 Rd.,Patumwan, Bangkok 10330",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: screenHeight * 0.02, fontWeight: FontWeight.w400))
        ]),
      );
    }

    Widget receiptData() {
      return Container(
          width: screenWidth,
          color: Colors.grey[350],
          padding: EdgeInsets.fromLTRB(screenWidth * 0.03, screenHeight * 0.01,
              screenWidth * 0.03, screenHeight * 0.02),
          margin: EdgeInsets.fromLTRB(screenWidth * 0.06, screenHeight * 0.02,
              screenWidth * 0.06, screenHeight * 0.02),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Approved",
                style: TextStyle(fontWeight: FontWeight.w700)),
            SizedBox(height: screenHeight * 0.01),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("Trace No:"), Text("14")]),
            SizedBox(height: screenHeight * 0.005),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("Batch No:"), Text("000014")]),
            SizedBox(height: screenHeight * 0.005),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Transaction ID:"),
                  Text("265488810330409167")
                ]),
            SizedBox(height: screenHeight * 0.005),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("Invoice No:"), Text("000005")]),
            SizedBox(height: screenHeight * 0.02),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Total:", style: TextStyle(fontWeight: FontWeight.w700)),
                  Text("THB 1,250.00",
                      style: TextStyle(fontWeight: FontWeight.w700))
                ]),
            SizedBox(height: screenHeight * 0.02),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("Transaction:"), Text("Thu 21/08/2022")]),
            SizedBox(height: screenHeight * 0.005),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("Date:"), Text("17:34:12 (GMT+07:00)")]),
            SizedBox(height: screenHeight * 0.005),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("MID:"), Text("GBPRIME21H000203389")])
          ]));
    }

    Widget button() {
      return Column(children: [
        TextButton(
            onPressed: () {},
            child: Container(
                width: screenWidth,
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.02,
                    screenHeight * 0.02,
                    screenWidth * 0.02,
                    screenHeight * 0.02),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff006dbe)),
                child: const Text("PRINT",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700)))),
        TextButton(
            onPressed: () {},
            child: Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.02,
                    screenHeight * 0.02,
                    screenWidth * 0.02,
                    screenHeight * 0.02),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xff006dbe), width: 1.0)),
                alignment: Alignment.center,
                child: const Text("VOID TRANSACTION",
                    style: TextStyle(
                        color: Color(0xff006dbe),
                        fontWeight: FontWeight.w700)))),
        TextButton(
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Order())),
            child: Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.02,
                    screenHeight * 0.02,
                    screenWidth * 0.02,
                    screenHeight * 0.02),
                decoration: BoxDecoration(
                    color: const Color(0xfff2fc62),
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xff006dbe), width: 1.0)),
                alignment: Alignment.center,
                child: const Text("GO TO MAIN",
                    style: TextStyle(
                        color: Color(0xff006dbe),
                        fontWeight: FontWeight.w700))))
      ]);
    }

    Widget body() {
      return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [header(), receiptData(), button()]));
    }

    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black87),
            backgroundColor: Colors.white,
            title: const Text("Branch: Central World",
                style: TextStyle(color: Colors.black87))),
        body: body());
  }
}
