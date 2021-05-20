import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/home_repository.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:photo_view/photo_view.dart';

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    child: PhotoView.customChild(
                      child: Container(
                        child: Image.network(snapshot.data['avatar']),
                      ),
                      childSize: const Size(150.0, 150.0),
                      backgroundDecoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                      ),
                      minScale: PhotoViewComputedScale.contained * 0.8,
                      maxScale: PhotoViewComputedScale.covered * 1.2,
                    ),
                  ),
                ),
                Text(
                  snapshot.data['id'].toString(),
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  snapshot.data['first_name'] +
                      " " +
                      snapshot.data['last_name'],
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  snapshot.data['email'],
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      previousButton(),
                      nextButton(),
                    ],
                  ),
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
