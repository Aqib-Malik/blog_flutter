import 'dart:math';
import 'dart:ui';

import 'package:blog_flutter/Models/current_user.dart';
import 'package:blog_flutter/Post_Module/Views/App_Posts.dart';
import 'package:blog_flutter/common_widgets/CommonWidgets.dart';
import 'package:blog_flutter/controllers/authentication_controller.dart';
import 'package:blog_flutter/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_drawer/slide_drawer.dart';

class AniDrawerr extends StatelessWidget {
  AuthenticationController _authenticationController =Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      // wrap your HomePage with SlideDrawer
      body: SlideDrawer(
        isRotate: true,
        offsetFromRight: 80.0,
        curve: Curves.easeInOut,
  //duration: Duration(milliseconds: 600),
  rotateAngle: pi / 10,
  alignment: SlideDrawerAlignment.start,
  
  headDrawer: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: CircleAvatar(
                            radius: 50.0,
                            child: ClipOval(
                              child: Image(image: NetworkImage(currentUser.image.toString(),),height: 100,
                                width: 100,
                                fit: BoxFit.cover ,)
                            ),
                          ),
        ),
        Text(currentUser.name.toString(),style: TextStyle(color: Colors.white),),
        Text(currentUser.email.toString(),style: TextStyle(color: Colors.white),)
      ],
    ),
  ),
        items: [
          MenuItem('Home', icon: Icons.home,onTap: (){}),
          MenuItem('Log Out', icon: Icons.logout,isCloseDrawerWhenTapped: false,onTap: (){
            CommonWidgets.confirmBox("Log out", "Are you sure you wanna Logout?", () {
                 _authenticationController.logout();
                });
            
          }),
        ],
        brightness: Brightness.dark,
  backgroundGradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0], 
    colors: [
      Color(0xFF000046),
      Color(0xFF1CB5E0),
    ],
  ),
        child:ProductListView(),
      ),
    );
  }
}