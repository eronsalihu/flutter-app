import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
        ),
        title: Text("Eron Salihu"),
      ),
    );
  }
}
