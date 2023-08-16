import 'dart:convert';

import 'package:complexjsonhandling/model/json_one_model.dart';
import 'package:complexjsonhandling/model/json_three_model.dart';
import 'package:complexjsonhandling/model/json_two_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class JsonProvider {
  static List<JsonOneModel> postList = [];
  static List<JsonTwoModel> userList = [];
  static List<JsonThreeModel> postListtwo = [];

  static Future<List<JsonOneModel>> jsonPostGetter() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());

      for (Map<String, dynamic> i in result) {
        postList.add(JsonOneModel.fromJson(i));
      }

      return postList;
    }

    return postList;
  }

  static Future<List<JsonTwoModel>> jsonUserGetter() async {
    const userUrl = 'https://jsonplaceholder.typicode.com/users';

    Response response = await http.get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      for (Map<String, dynamic> i in result) {
        userList.add(JsonTwoModel.fromJson(i));
      }
      debugPrint(response.body);
      return userList;
    }
    return userList;
  }

  static Future<List<JsonThreeModel>> jsonPostGetterTwo() async {
    const url = 'https://jsonplaceholder.typicode.com/comments?postId=1';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      for (Map<String, dynamic> map in result) {
        postListtwo.add(JsonThreeModel.fromJson(map));
      }
      return postListtwo;
    }
    return postListtwo;
  }
}
