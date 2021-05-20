import 'dart:convert';
import 'package:flutter_app/data/home_repository.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class UserDetailsView extends StatefulWidget {
  final UserModel userModel;
  UserDetailsView(this.userModel);


  @override
  _UserDetailsViewState createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  final HomeRepository home_repository = new HomeRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              widget.userModel.firstName + " " + widget.userModel.lastName)),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: home_repository.getUserById(widget.userModel.id),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Container(
                    child: Center(child:Text(snapshot.error.toString())));
              }
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data.lenght,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(snapshot.data[index]['email'],
                            )
                          ],
                        ),
                      );
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }

  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Next"),
    );
  }

  Widget previousButton() {
    return ElevatedButton(onPressed: () {}, child: Text("Prev"));
  }
}
