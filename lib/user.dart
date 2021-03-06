// // import 'package:sound_kit/screens/dashboard.dart';
// // import 'package:sound_kit/utils/api.dart';
// // import 'package:sound_kit/utils/helpers.dart';
// import 'package:sound_controller/dashboard.dart';
// import 'package:sound_controller/utils';
// // import 'package:sound_controller/utils/helpers';
//
// class User {
//   final String name;
//   final String deviceId;
//   final String email;
//   final String password;
//
//   User(this.email, this.password, this.name, this.deviceId);
//
//   // to fromJson to User object
//   User.fromJson(Map<String, dynamic> json)
//       : email = json['email'],
//         password = json['password'],
//         name = json['name'],
//         deviceId = json['deviceId'];
//
//   // from User to json converter
//   Map<String, dynamic> toJson() {
//     return {
//       "email": email,
//       "password": password,
//       "name": name,
//       "deviceId": deviceId
//     };
//   }
//
//   signIn(context) async {
//     var user = new User(this.email, this.password, this.name, this.deviceId);
//     await login(user).then((response) {
//       response['resp_code'] == '200'
//           ? setTokenInStorage(context, response['token'])
//           : showSnack(context, 'Incorrect Email or Password');
//     }).catchError((err) {
//       showSnack(context, err.toString());
//     });
//   }
//
//   signUp(context) async {
//     var user = new User(this.email, this.password, this.name, this.deviceId);
//     await register(user).then((response) {
//       response['resp_code'] == '200'
//           ? setTokenInStorage(context, response['token'])
//           : showSnack(context, 'Account already exists');
//     }).catchError((err) {
//       showSnack(context, err.toString());
//     });
//   }
//
//   setTokenInStorage(context, token) async {
//     // set token in shared_pref
//     storeInLocalStorage('token', token, 'str');
//     // redirect to dashboard
//     newPageDestroyPrevious(context, Dashboard());
//   }
// }
