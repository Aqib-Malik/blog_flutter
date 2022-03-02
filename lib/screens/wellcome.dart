import 'package:blog_flutter/screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Post_Module/Views/App_Posts.dart';

class WellCome extends StatefulWidget {
  const WellCome({ Key? key }) : super(key: key);

  @override
  _WellComeState createState() => _WellComeState();
}

class _WellComeState extends State<WellCome> {
  var a;
  checkLogin()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    a=pref.get("token");
  }
  @override
  void initState() {
    super.initState();
    checkLogin().whenComplete((){
      print(a);
     a==null?Get.off(Signup()):Get.off(ProductListView());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}