import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/user_details_view.dart';
import 'package:flutter_app/data/home_repository.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {

@override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Home_Repository home_repository = new Home_Repository();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
      ),
      body: Container(
        child: FutureBuilder(
          future: home_repository.getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Container(
                  child: Center(
                      child: Text("Loading...")
                  )
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetailsView(snapshot.data[index])));
                    },
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 30 ,
                            backgroundImage: NetworkImage(
                                snapshot.data[index].avatar
                            ),
                          ),
                          title: Text(snapshot.data[index].firstName+" "+snapshot.data[index].lastName),
                        ),
                        Padding(padding: EdgeInsets.only(right: 20,left: 80),
                        child: Divider(thickness: 1.5),)
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

}
