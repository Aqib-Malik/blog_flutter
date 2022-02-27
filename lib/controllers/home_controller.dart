// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:blog_flutter/Models/Post.dart';
import 'package:blog_flutter/commonStrings/strings.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
var isCommentShow=false.obs;
  
List<Post>? _posts;  
List data = [].obs;
List categoryList = [].obs;
List Postwrtcat = [].obs;
  var idLoad=true.obs;

Future<bool> getPostData() async {
  var response;
   try {
      SharedPreferences pref=await SharedPreferences.getInstance();
      var a=pref.get("token");
       response =
          await http.get(Uri.parse(api_url), headers: {'Authorization': 'Token $a'});//1e14e9b9b1d88d7cacf25c4f791525f8adbf59a9
      data = json.decode(response.body) as List;
      print("##########################");
      // print(data);
      print(response.statusCode);
      
      return true;
    } catch (e) {
      print("error getPostData");
      print(e);
      print(response.statusCode);
      return false;
    }


    // try {
    //   SharedPreferences pref=await SharedPreferences.getInstance();
    //   var a=pref.get("token");
    // // String url='https://blogappinfludja.herokuapp.com/';
    //   String url = 'https://blogappdej.herokuapp.com/';
    //   http.Response response =
    //       await http.get(Uri.parse(url), headers: {'Authorization': 'Token $a'});//1e14e9b9b1d88d7cacf25c4f791525f8adbf59a9
    //   data = json.decode(response.body) as List;
    //   print(data);
    //   List<Post> temp = [];
    //   data.forEach((element) {
    //     Post post = Post.fromJson(element);
    //     //print(post);
    //     temp.add(post);
    //   });
    //   _posts = temp;
    //   //print(temp);
    //   return true;
    // } catch (e) {
    //   print("error getPostData");
    //   print(e);
    //   return false;
    // }
  }
///////////get category
Future<bool> getCategoryData() async {
    try {
      SharedPreferences pref=await SharedPreferences.getInstance();
      var a=pref.get("token");
      String url = '${api_url}/cat/category/';
      http.Response response =
          await http.get(Uri.parse(url), headers: {'Authorization': 'Token $a'});//1e14e9b9b1d88d7cacf25c4f791525f8adbf59a9
      categoryList = json.decode(response.body) as List;
      print("##########################");
      print(categoryList);
      
      return true;
    } catch (e) {
      print("error getPostData");
      print(e);
      return false;
    }
  }

  ///////////get Post WRT Category
Future<bool> getPost_WRT_Category(var cid) async {
    try {
      SharedPreferences pref=await SharedPreferences.getInstance();
      var a=pref.get("token");
      String url = '${api_url}/$cid/';
      http.Response response =
          await http.get(Uri.parse(url), headers: {'Authorization': 'Token $a'});
      Postwrtcat = json.decode(response.body);
      print("***********************");
      print(Postwrtcat);
      
      return true;
    } catch (e) {
      print("error getPostData");
      print(e);
      return false;
    }
  }

}



