import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:news/model/newsapi.dart';
import 'package:http/http.dart' as http;
import '../program.dart';

class GetApi{

  static Future<newsapi?> getnewsdata(BuildContext context)
  async {
    try {
      http.Response data = await http.get(
          Uri.parse(ProgramApp.baseurl + "&apiKey="+ProgramApp.apikey),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });
      var jsonData = json.decode(data.body);

      var newsdata = newsapi.fromJson(jsonData);

      return newsdata;
    } catch (e) {
     // print(e);
      return null;
    }
  }
}