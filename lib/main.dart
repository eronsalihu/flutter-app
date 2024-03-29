import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/home.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: "OpenSans",
      ),
      home: Home(),
    );
  }
}
