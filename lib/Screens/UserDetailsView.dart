import 'package:flutter/material.dart';
import 'package:flutter_app/Models/UserModel.dart';

class UserDetailsView extends StatefulWidget {
  final UserModel userModel;
  UserDetailsView(this.userModel);

  @override
  _UserDetailsViewState createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text(widget.userModel.firstName+" "+ widget.userModel.lastName)),
      body: ListView(
        children: [
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                widget.userModel.avatar
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(6)),
          Center(
            child: Text(widget.userModel.id.toString(), style: TextStyle(fontSize: 18),),
          ),
          Center(
            child: Text(widget.userModel.firstName+" "+ widget.userModel.lastName, style: TextStyle(fontSize: 18),),
          ),
          Center(
            child: Text(widget.userModel.email, style: TextStyle(fontSize: 18),),
          ),

        ],
      )
    );
  }
}

