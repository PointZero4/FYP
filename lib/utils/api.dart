import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sound_controller/models/user.dart';

var url = 'http://hp.com';

Future login(User user) async {
  var headers = {"Content-Type": "application/json;charset=UTF-8"};
  var encode = json.encode(user.toJson());

//  make call
  return await http
      .post(Uri.parse('$url/login'), headers: headers, body: encode)
      .then((response) {
    return jsonDecode(response.body);
  }).catchError((err) {
    throw err;
  });
}


Future register(User user) async {
  var headers = {"Content-Type": "application/json;charset=UTF-8"};
  var encode = json.encode(user.toJson());

//  make call
  return await http
      .post(Uri.parse('$url/register'), headers: headers, body: encode)
      .then((response) {
    return jsonDecode(response.body);
  }).catchError((err) {
    throw err;
  });
}
