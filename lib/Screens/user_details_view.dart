import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/user_model.dart';
import 'package:photo_view/photo_view.dart';

class UserDetailsView extends StatefulWidget {
  final UserModel userModel;
  UserDetailsView(this.userModel);

  @override
  _UserDetailsViewState createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {

  // Future<List<UserModel>> switchUser() async {
  //   int id = widget.userModel.id;
  //   var data = await http.get("https://reqres.in/api/users/"+id.toString());
  //   var jsonData = json.decode(data.body)['data'];
  //
  //   List<UserModel> usersFilterById = [];
  //
  //   for(var u in jsonData){
  //
  //     UserModel user = UserModel(u["id"], u["first_name"], u["last_name"], u["email"], u["avatar"]);
  //     usersFilterById.add(user);
  //
  //   }
  //
  //   return usersFilterById;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text(widget.userModel.firstName+" "+ widget.userModel.lastName)),
      body: ListView(
        children: [
          Container(
            height: 100,
            child: PhotoView(
              backgroundDecoration: BoxDecoration(color: Colors.transparent),
              imageProvider: NetworkImage(widget.userModel.avatar),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: 4.0,
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Center(
            child: Text(widget.userModel.id.toString(), style: TextStyle(fontSize: 18),),
          ),
          Center(
            child: Text(widget.userModel.firstName+" "+ widget.userModel.lastName, style: TextStyle(fontSize: 18),),
          ),
          Center(
            child: Text(widget.userModel.email, style: TextStyle(fontSize: 18),),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(onPressed: (){
                },
                    child: Icon(Icons.navigate_before)),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(onPressed: (){
                  nextUser(widget.userModel.id);
                },
                    child: Icon(Icons.navigate_next),),
              ),
            ],
          )
        ],
        
      )
    );
  }

  Widget nextUser(id){
    id++;
    return Scaffold(
      appBar: AppBar(title: Text(widget.userModel.id.toString()),),
    );
  }
}

