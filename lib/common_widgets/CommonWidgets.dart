// ignore_for_file: deprecated_member_use

import 'package:blog_flutter/Post_Module/Views/CategoryPost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonWidgets {
  static categoryWidget(int? id,String str) {
    return Container(
      
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: RaisedButton(
            color: Colors.blue,
            onPressed: () {
               Get.to(CategoryPost(),arguments: {
                 'cid':id,
                 'title':str});
            },
            child: Text(str,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
          ),
        ));
  }

    /////////////////////*************DialogBox */
    static  confirmBox(String titlle, String texte, VoidCallback click) {
    return Get.defaultDialog(
        title: titlle,
        middleText: texte, //"Are you sure you want to delete this user?",
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Get.back();
                    },
                    color: Colors.amber,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      click();
                      Get.back();
                      // AuthServices.deleteAccount(email);
                      //Get.back();
                    },
                    color: Colors.red,
                    child: Text(
                      titlle,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          )
        ]);
  }
}


