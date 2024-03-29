import 'package:flutter/material.dart';
import 'package:flutter_app/screens/user_details_view.dart';
import 'package:flutter_app/data/home_repository.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeRepository home_repository = new HomeRepository();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
        elevation: 20.0,
        brightness: Brightness.dark,
      ),
      body: Container(
        child: FutureBuilder(
          future: home_repository.getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: new CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UserDetailsView(snapshot.data[index]),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(snapshot.data[index].avatar),
                              ),
                              title: Text(snapshot.data[index].firstName +
                                  " " +
                                  snapshot.data[index].lastName),
                              trailing: Icon(Icons.info),
                            ),
                          ],
                        ),
                      ),
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
