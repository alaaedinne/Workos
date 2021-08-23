import 'package:flutter/material.dart';
import 'package:workos_en/screen/auth/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Workos',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEDE7DC),
        primarySwatch: Colors.blue,
      ),
      home: login(),
    );
  }
}
