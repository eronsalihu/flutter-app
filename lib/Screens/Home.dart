import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/UserModel.dart';
import 'package:flutter_app/Screens/UserDetailsView.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

@override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<List<UserModel>> getUsers() async {

    var data = await http.get("https://reqres.in/api/users?per_page=12");
    var jsonData = json.decode(data.body)['data'];

    List<UserModel> users = [];

    for(var u in jsonData){

      UserModel user = UserModel(u["id"], u["first_name"], u["last_name"], u["email"], u["avatar"]);
      users.add(user);

    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getUsers(),
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
