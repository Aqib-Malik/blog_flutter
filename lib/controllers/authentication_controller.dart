// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:blog_flutter/Models/current_user.dart';
import 'package:blog_flutter/commonStrings/strings.dart';
import 'package:blog_flutter/screens/home.dart';
import 'package:blog_flutter/screens/login/login.dart';
import 'package:blog_flutter/shared_pref_helper.dart';
//import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:get/get.dart' hide FormData, MultipartFile;

import 'package:dio/dio.dart';

class AuthenticationController extends GetxController {

  List data = [].obs;
  var idLoad = true.obs;

  uploadImge(File? image, int id) async {
    var formData = FormData.fromMap(
        {'image': await MultipartFile.fromFile(image!.path), 'user': id});
    var res =
        await Dio().post("${api_url}/cat/profile/", data: formData);
    print(res.statusCode);
    print(res);
  }
////*******************get current */
  Future<bool> getCurrentUserData(int id) async {
    try {
      SharedPreferences pref=await SharedPreferences.getInstance();
      var a=pref.get("token");
      String url = '${api_url}/prof/$id/';
      http.Response response =
          await http.get(Uri.parse(url), headers: {'Authorization': 'Token $a'});//1e14e9b9b1d88d7cacf25c4f791525f8adbf59a9
      var currentUserData = json.decode(response.body);
      print("********Current User**********");
      currentUser.name=currentUserData[0]['user']['username'];
      currentUser.email=currentUserData[0]['user']['email'];
      currentUser.image="${api_url}"+currentUserData[0]['image'];
      
      print(currentUserData);
      
      return true;
    } catch (e) {
      print("error current user");
      print(e);
      return false;
    }
  }

/////////////////////////////////////******************Authentication
// //////signup
//   cretate_user_api(
//       String name, String email, String password, File? image) async {
//     var formData = FormData.fromMap({
//       'username': name,
//       'email': email,
//       'password': password,
//       'Image': await MultipartFile.fromFile(image!.path),
//     });
//     var res =
//         await Dio().post("http://10.0.2.2:8000/api/register/", data: formData);
//     print(res.statusCode);
//     print(res.data);
//       var da = jsonDecode(res.data);
//       print(da['id']);
//       if (res.statusCode == 200) {
//         Get.snackbar("Created", "Account created successfully");
//         print(da['user']['id']);
//         //currentUser.usertoken=da["token"];
//         // SharedPreferencesHelper().setcurrentUser(
//         //     da["user"]["username"], da["user"]["email"], da["user"]["id"]);
//         // final prefs = await SharedPreferences.getInstance();
//         // await SharedPreferencesHelper().settoken(da["token"]);
//         uploadImge(image, da['user']['id']);
//         Get.off(ImageTesting());
//       } else {
//         Get.snackbar("Error", "Some thing Wrong!!");
//        }

//     // try {
//     //   var res = await http.post(
//     //     Uri.parse("http://10.0.2.2:8000/api/register/"
//     //         //"http://10.0.2.2:8000/user_api/"
//     //         ),
//     //     headers: <String, String>{
//     //       'Content-Type': 'application/json; charset=UTF-8',
//     //     },
//     //     body: jsonEncode(<String, String>{
//     // 'username': name,
//     // 'email': email,
//     // 'password': password,
//     //       'image': "image"
//     //     }),
//     //   );
//     //   print(res.statusCode);
//     //   var da = jsonDecode(res.body);

//     //   if (res.statusCode == 200) {
//     //     Get.snackbar("Created", "Account created successfully");
//     //     //currentUser.usertoken=da["token"];
//     //     SharedPreferencesHelper().setcurrentUser(
//     //         da["user"]["username"], da["user"]["email"], da["user"]["id"]);
//     //     final prefs = await SharedPreferences.getInstance();
//     //     await SharedPreferencesHelper().settoken(da["token"]);
//     //     Get.off(ImageTesting());
//     //   } else {
//     //     Get.snackbar("Error", "Some thing Wrong!!");
//     //   }

//     //   print(res);
//     // } catch (e) {
//     //   print(e);
//     // }
//   }
//////signup
  cretate_user_api(
      String name, String email, String password, File? image) async {
    try {
      var res = await http.post(
        Uri.parse("${api_url}/api/register/"
            //"http://10.0.2.2:8000/user_api/"
            ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': name,
          'email': email,
          'password': password,
          'image': "image"
        }),
      );
      print(res.statusCode);
      print(res.body);
      var da = jsonDecode(res.body);

      if (res.statusCode == 200) {
        uploadImge(image, da['user']['id']);
        Get.snackbar("Created", "Account created successfully");
        // final pref = await SharedPreferences.getInstance();
        // pref.setString("token", da["token"]);
        // pref.setInt("userId", da["user"]["id"]);
        // SharedPreferencesHelper().setcurrentUser(
        //     da["user"]["username"], da["user"]["email"], da["user"]["id"]);
        // final prefs = await SharedPreferences.getInstance();
        // await SharedPreferencesHelper().settoken(da["token"]);
        Get.to(Login());
      } else {
        Get.snackbar("Error", "Some thing Wrong!!");
      }

      print(res);
    } catch (e) {
      print(e);
    }
  }

///////login
  login_user_api(String name, String password) async {
    try {
      var res = await http.post(
        Uri.parse("${api_url}/api/login/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{"username": name, 'password': password}),
      );
      var da = jsonDecode(res.body);
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        Get.snackbar("Log in", "You successfully Login");

        final pref = await SharedPreferences.getInstance();
        pref.setString("token", da["token"]);
        pref.setInt("userId", da["user"]["id"]);
        Get.off(Home());
        //print(currentUser.usertoken);
      } else {
        Get.snackbar("Error", "Some thing Wrong!!");
      }

      print(res);
    } catch (e) {
      print(e);
    }
  }

//////Logout
  Future<void> logout() async {
    try {
      final token = await SharedPreferencesHelper().gettoken();
      var res = await http.post(Uri.parse('${api_url}/api/logout/'),
          headers: {'Authorization': "Token $token"});

      print(res.statusCode);
      if (res.statusCode == 204) {
        // Obtain shared preferences.
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('token');
        await prefs.remove('userId');
        Get.offAll(Login());

        Get.snackbar("Logout", "logout...");
      }

      print(res.body);
    } catch (e) {
      print(e);
    }
  }
}
