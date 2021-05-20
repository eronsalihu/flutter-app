import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/user_model.dart';

class HomeRepository {
  Future<List<UserModel>> getUsers() async {
    var data = await http.get("https://reqres.in/api/users?per_page=12");
    var jsonData = json.decode(data.body)['data'];

    List<UserModel> users = [];

    for (var u in jsonData) {
      UserModel user = UserModel(
          u["id"], u["first_name"], u["last_name"], u["email"], u["avatar"]);
      users.add(user);
    }

    return users;
  }

  Future getUserById(id) async {
    var data = await http.get("https://reqres.in/api/users/$id");
    var jsonData = json.decode(data.body)['data'];
    print(jsonData);
    return jsonData;
  }

}
