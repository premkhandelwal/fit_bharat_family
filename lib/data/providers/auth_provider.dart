import 'dart:convert';

import 'package:fit_bharat_family/config/globals/secrets.dart';
import 'package:fit_bharat_family/data/models/user.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  Future<bool> signUp(User user) async {
    String url = Secrets.baseURL + "customers/";
    String token = base64.encode(
        utf8.encode(Secrets.customerKey + ":" + Secrets.customerSecret));
    ;
    Uri uri = Uri.parse(url);
    var res = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Basic " + token
        },
        body: user.toJson());
    print(res.body);
    return res.statusCode == 201;
  }
}
