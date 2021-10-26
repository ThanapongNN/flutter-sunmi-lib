import 'package:atome/screen/login.dart';
import 'package:atome/screen/order.dart';
import 'package:atome/screen/receipt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final startDateController = TextEditingController();
  FocusNode startDateNode = FocusNode();

  final endDateController = TextEditingController();
  FocusNode endDateNode = FocusNode();

  String? start, end;

  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    Widget searchBar() {
      return Container(
          width: screenWidth,
          padding: EdgeInsets.fromLTRB(
              screenWidth * 0.02, screenHeight * 0.02, screenWidth * 0.02, 0),
          child: Column(children: [
            Row(children: [
              const Expanded(flex: 1, child: Text("Start Date")),
              Expanded(
                  flex: 4,
                  child: TextFormField(
                      readOnly: true,
                      onTap: () => DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2021, 3, 5),
                              maxTime: DateTime(2031, 6, 7),
                              onChanged: (date) {}, onConfirm: (date) {
                            startDateController.text = date.toIso8601String();
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en),
                      controller: startDateController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.datetime,
                      focusNode: startDateNode,
                      decoration: InputDecoration(
                          hintText: 'Start date',
                          suffixStyle: const TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFF9F02)),
                              borderRadius: BorderRadius.circular(8)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFF9F02)),
                              borderRadius: BorderRadius.circular(8)))))
            ]),
            SizedBox(height: screenHeight * 0.03),
            Row(children: [
              const Expanded(flex: 1, child: Text("End Date")),
              Expanded(
                  flex: 4,
                  child: TextFormField(
                      readOnly: true,
                      onTap: () => DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2021, 3, 5),
                              maxTime: DateTime(2031, 6, 7),
                              onChanged: (date) {}, onConfirm: (date) {
                            endDateController.text = date.toIso8601String();
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en),
                      controller: endDateController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.datetime,
                      focusNode: endDateNode,
                      decoration: InputDecoration(
                          hintText: 'End date',
                          suffixStyle: const TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFF9F02)),
                              borderRadius: BorderRadius.circular(8)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFF9F02)),
                              borderRadius: BorderRadius.circular(8)))))
            ]),
            TextButton(
                onPressed: () => setState(() => isSearch = !isSearch),
                child: Container(
                    width: screenWidth,
                    padding: EdgeInsets.fromLTRB(
                        screenWidth * 0.02,
                        screenHeight * 0.02,
                        screenWidth * 0.02,
                        screenHeight * 0.02),
                    alignment: Alignment.center,
                    color: const Color(0xfff2fc62),
                    child: const Text("Search",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w700))))
          ]));
    }

    Widget resultSearch() {
      return Container(
          width: screenWidth,
          color: Colors.grey[200],
          height: screenHeight * 0.6,
          child: isSearch
              ? ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        width: screenWidth,
                        margin: EdgeInsets.fromLTRB(screenWidth * 0.02, 0,
                            screenWidth * 0.02, screenHeight * 0.01),
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.02,
                            screenHeight * 0.02,
                            screenWidth * 0.02,
                            screenHeight * 0.02),
                        color: Colors.grey[350],
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(children: [
                                Text("Date",
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.02,
                                        fontWeight: FontWeight.w700)),
                                const Text("12/08/2021")
                              ]),
                              Column(children: [
                                Text("TransactionID",
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.02,
                                        fontWeight: FontWeight.w700)),
                                const Text("265488810330409167",
                                    style: TextStyle(color: Color(0xfff2fc62)))
                              ]),
                              Column(children: [
                                Text("Status",
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.02,
                                        fontWeight: FontWeight.w700)),
                                const Text("PAID",
                                    style: TextStyle(color: Color(0xFFBD59FF)))
                              ]),
                              IconButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Receipt())),
                                  icon: const Icon(Icons.arrow_forward_ios,
                                      color: Colors.black87, size: 20))
                            ]));
                  })
              : Container(
                  width: screenWidth,
                  alignment: Alignment.center,
                  child: const Text("No Result")));
    }

    Widget body() {
      return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [searchBar(), resultSearch()]));
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
            title: const Text("Transaction History",
                style: TextStyle(color: Colors.black87))),
        body: body());
  }
}
