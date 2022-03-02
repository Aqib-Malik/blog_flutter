import 'package:blog_flutter/Models/current_user.dart';
import 'package:blog_flutter/Post_Module/Views/drawerr.dart';
import 'package:blog_flutter/Post_Module/Views/post_screen.dart';
import 'package:blog_flutter/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/CommonWidgets.dart';
import '../Controllers/post_controller.dart';

// ignore: must_be_immutable
class ProductListView extends StatelessWidget {
  ProductListView({ Key? key }) : super(key: key);
  PostController controller=Get.put(PostController());
  AuthenticationController _authenticationController=Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            InkWell(
                onTap: () {
                  CommonWidgets.confirmBox(
                      "Log out", "Are you sure you want to logout?", () {
                    _authenticationController.logout();
                  });
                },
                child: Icon(Icons.logout_sharp))
          ],
          title: InkWell(
              onTap: () {
                //var image="http://10.0.2.2:8000"+currentUser.image.toString();
                //print("http://10.0.2.2:8000");
                
                  print(currentUser.image);
                  print(currentUser.name);
              },
              child: Text("Programming Blogs")),
          centerTitle: true,
        ),
        drawer: Drawerr(),
      body: Obx(()=>
        controller.isLoading.value?
            Center(child:CircularProgressIndicator(),)
        
        
          :Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
              height: 60,
                child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller
                                .catList.length, //controller._.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CommonWidgets.categoryWidget(
                                  controller.catList[index].id,
                                  controller.catList[index].title.toString());
                            }),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.postList.length,
                  itemBuilder:(context,index){
                    return blogPage(
                                  code: controller.postList[index].code,
                                  category: controller.postList[index].category!.title,
                                  title: controller.postList[index].title,
                                  // totalLikes:
                                  //     controller.postList[index].,
                                  content:
                                      controller.postList[index].content,
                                  ind: index,
                                  // ismeLike: controller.data[index]['like'],
                                );
                  } ),
              ),
            ],
          )
        
      ),

    );
  }
}