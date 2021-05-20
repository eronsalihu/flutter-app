import 'package:flutter/material.dart';
import 'package:flutter_app/data/home_repository.dart';
import 'package:flutter_app/models/user_model.dart';

class UserDetailsView extends StatefulWidget {
  final UserModel userModel;
  int currUserId;

  UserDetailsView(this.userModel) {
    currUserId = userModel.id;
  }

  @override
  _UserDetailsViewState createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  final HomeRepository homeRepository = new HomeRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: homeRepository.getUserById(widget.currUserId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Container(
            child: Center(
              child: Text(
                snapshot.error.toString(),
              ),
            ),
          );
        }
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data['first_name'] +
                  " " +
                  snapshot.data['last_name']),
            ),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.network(
                    snapshot.data['avatar'],
                    fit: BoxFit.fill,
                  ),
                ),
                Text(snapshot.data['id'].toString()),
                Text(snapshot.data['first_name']+" "+snapshot.data['last_name']),
                Text(snapshot.data['email']),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    previousButton(),
                    nextButton(),
                  ],
                )
              ],
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        if (widget.currUserId == 12) return;
        setState(() {
          widget.currUserId++;
        });
      },
      child: Text("Next"),
    );
  }

  Widget previousButton() {
    return ElevatedButton(
        onPressed: () {
          if (widget.currUserId == 1) return;
          setState(() {
            widget.currUserId--;
          });
        },
        child: Text("Prev"));
  }
}