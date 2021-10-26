import 'package:atome/screen/history.dart';
import 'package:atome/screen/login.dart';
import 'package:atome/screen/qr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final amountController = TextEditingController();
  FocusNode amountNode = FocusNode();
  double currentValue = 0.0;
  bool doOperation = false;
  Color? notClick = Colors.grey[350];
  Color? isClick = Colors.grey[700];

  @override
  void initState() {
    amountController.text = "0.00";
    currentValue = double.parse(amountController.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    Widget calculator() {
      return SizedBox(
          width: screenWidth,
          height: screenHeight * 0.6,
          child: SimpleCalculator(
            value: 0.00,
            hideExpression: true,
            onChanged: (key, value, expression) {
              amountController.text = value.toString();
            },
            theme: const CalculatorThemeData(
                displayStyle: TextStyle(fontSize: 80, color: Colors.black54)),
          ));
    }

    Widget amountScreen() {
      return Container(
        width: screenWidth,
        padding: EdgeInsets.fromLTRB(
            screenWidth * 0.02, screenHeight * 0.02, screenWidth * 0.04, 0),
        child: Text("Sub Total",
            style:
                TextStyle(color: Colors.grey, fontSize: screenHeight * 0.03)),
      );
    }

    Widget payButton() {
      return TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      QR(amountTotal: double.parse(amountController.text)))),
          child: Container(
              width: screenWidth,
              padding: EdgeInsets.fromLTRB(screenWidth * 0.02,
                  screenHeight * 0.02, screenWidth * 0.02, screenHeight * 0.02),
              alignment: Alignment.center,
              color: const Color(0xfff2fc62),
              child: const Text("Pay",
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w700))));
    }

    Widget body() {
      return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [amountScreen(), calculator(), payButton()]));
    }

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF838383)),
              child: Text('GBPrime pay - Central World Branch')),
          ListTile(
              title: const Text('Main'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Order()));
              }),
          ListTile(
              title: const Text('Transaction History'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const History()));
              }),
          ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              })
        ])),
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black87),
            backgroundColor: Colors.white,
            title: const Text("Merchant Center App Offline",
                style: TextStyle(color: Colors.black87))),
        body: body());
  }
}
