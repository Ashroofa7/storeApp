import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  //get method
  Future<dynamic> getUrl({required String url,String? token}) async {

    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    //calling method
    http.Response response = await http.get(
      Uri.parse(url),
    );
    print(url);
    //check call
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    } else {
      throw Exception('There\'s something went wrong${response.statusCode}');
    }
  }

  //Post Method
  Future<dynamic> postUrl({
    required String url,
    @required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    //token check
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    //calling method
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    //check calling
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      {
        throw Exception(
          'There\'s something went wrong${response.statusCode}',
        );
      }
    }
  }

  //Put Method
  Future<dynamic> putUrl({
    required String url,
    @required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type':'application/x-www-form-urlencoded',
    };
    //token check
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    //calling method
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    //check calling
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print ('success');
      return data;
    } else {
      {
        throw Exception(
          'There\'s something went wrong${response.statusCode}',
        );
      }
    }
  }

}
