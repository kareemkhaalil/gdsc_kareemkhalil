import 'package:flutter/material.dart';
import 'package:gdsc_kareemkhalil/auth/login.dart';
import 'package:gdsc_kareemkhalil/auth/signUp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
