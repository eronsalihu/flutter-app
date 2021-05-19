import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

@override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List users = [
  ];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUsers();
  }

  fetchUsers() async{
    var url = "https://reqres.in/api/users?per_page=12";
    var response = await http.get(url);
    if(response.statusCode == 200){
      var items = json.decode(response.body)["data"];
      setState(() {
        users = items;
      });
      print(items);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
      ),
      body: getBody(),

    );
  }

  Widget getBody(){
    List items = [
      "1","2"
    ];

    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,index){
      return getCard(users[index]);
    });
  }

  Widget getCard(index){

    var fullName = index['first_name']+" "+index['last_name'];
    var avatar = index['avatar'];
    return InkWell(
      onTap: (){
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  avatar
              ),
            ),
            title: Text(fullName.toString()),
          ),
          Padding(padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1.5,
            ),),
        ],
      ),
    );
  }
}
