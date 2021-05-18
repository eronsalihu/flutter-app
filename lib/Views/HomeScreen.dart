import 'package:flutter/material.dart';
import 'package:flutter_app/Models/CustomCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data",),
      ),
      body: ListView(
        children: [CustomCard()],
      ),
    );
  }
}
