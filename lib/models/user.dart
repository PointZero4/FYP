// import 'package:sound_kit/screens/dashboard.dart';
import 'package:sound_controller/login.dart';
import 'package:sound_controller/utils/api.dart';
import 'package:sound_controller/utils/helpers.dart';

class User {
  final String name;
  final String deviceId;
  final String email;
  final String password;

  User(this.email, this.password, this.name, this.deviceId);

  // to fromJson to User object
  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        name = json['name'],
        deviceId = json['deviceId'];

  // from User to json converter
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "name": name,
      "deviceId": deviceId
    };
  }

  signIn(context) async {
    var user = new User(this.email, this.password, this.name, this.deviceId);
    await login(user).then((response) {
      response['resp_code'] == '200'
          ? setTokenInStorage(context, response['token'])
          : print("Incorrect details. Try again");
    }).catchError((err) {
      showSnack(context, err.toString());
    });
  }

  signUp(context) async {
    var user = new User(this.email, this.password, this.name, this.deviceId);
    await register(user).then((response) {
      response['resp_code'] == '200'
          ? setTokenInStorage(context, response['token'])
          : print('Account already exists');
    }).catchError((err) {
      print(err.toString());
    });
  }

  setTokenInStorage(context, token) async {
    // set token in shared_pref
    storeInLocalStorage('token', token, 'str');
    // redirect to dashboard
    newPage(context, LoginPage());
  }
}
