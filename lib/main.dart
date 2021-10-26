import 'package:atome/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const AtomeApp());
}

class AtomeApp extends StatelessWidget {
  const AtomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}
