import 'package:blog_flutter/ani_drawer/draw.dart';
import 'package:blog_flutter/screens/wellcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

