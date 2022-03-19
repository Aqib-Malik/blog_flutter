


import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Post_Module/Models/Post_Model.dart';
import '../Post_Module/Models/cat_model.dart';
import '../commonStrings/strings.dart';
class ApiService{

  static Future getPostData() async {
  var response;
   try {
      SharedPreferences pref=await SharedPreferences.getInstance();
      var a=pref.get("token");
       response =
          await http.get(Uri.parse(api_url), headers: {'Authorization': 'Token $a'});//1e14e9b9b1d88d7cacf25c4f791525f8adbf59a9
      // data = json.decode(response.body) as List;
      print("##########################");
      // print(data);
      print(response.statusCode);
      if(response.statusCode==200){
          var jsonString=response.body;
          return postFromJson(jsonString);
      }
     
    } catch (e) {
      print("error getPostData");
      print(e);
      print(response.statusCode);
      
    }
  }

  static Future getCategoryData() async {
    try {
      SharedPreferences pref=await SharedPreferences.getInstance();
      var a=pref.get("token");
      String url = '${api_url}/cat/category/';
      http.Response response =
          await http.get(Uri.parse(url), headers: {'Authorization': 'Token $a'});//1e14e9b9b1d88d7cacf25c4f791525f8adbf59a9
      // var categoryList = json.decode(response.body) as List;
      print("##########################");
      // print(categoryList);
      if(response.statusCode==200){
        var jsonString=response.body;
          return categoryFromJson(jsonString);

      }
      // return categoryList;
      
      
    } catch (e) {
      print("error getPostData");
      print(e);
    }
  }
  
}