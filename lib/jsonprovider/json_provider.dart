import 'dart:convert';

import 'package:complexjsonhandling/model/json_one_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JsonProvider {
  static List<JsonOneModel> postList = [];
  static List<JsonOneModel> postLists = [];

  static Future<List<JsonOneModel>> mapTaker() async {
    const _url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());

      for (Map<String, dynamic> i in result) {
        postList.add(JsonOneModel.fromJson(i));
      }

      return postList;
    }

    return postLists;
  }
}
