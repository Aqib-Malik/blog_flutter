import 'package:blog_flutter/imageTesing.dart';
import 'package:blog_flutter/screens/home.dart';
import 'package:blog_flutter/screens/signup/signup.dart';
import 'package:blog_flutter/screens/wellcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Programming Blog App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:WellCome() //Signup()//ImageTesting()//Home(),
     );
    
    });
  }
}

