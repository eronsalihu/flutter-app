import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "OpenSans"
      ),
      home: Home(),
    );
  }
}

