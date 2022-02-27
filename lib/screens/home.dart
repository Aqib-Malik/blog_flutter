import 'package:blog_flutter/Models/current_user.dart';
import 'package:blog_flutter/common_widgets/CommonWidgets.dart';
import 'package:blog_flutter/controllers/authentication_controller.dart';
import 'package:blog_flutter/controllers/home_controller.dart';
import 'package:blog_flutter/screens/drawerr.dart';
import 'package:blog_flutter/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var usId;
  checkId()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    usId=pref.get("userId");
  }
  HomeController controller = Get.put(HomeController());
  AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  @override
  void initState() {

    controller.getPostData();
     checkId().whenComplete((){
       _authenticationController.getCurrentUserData(usId);
      print(usId);
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          controller.getPostData();
        });
      },
      child: Scaffold(
        drawer: Drawerr(),
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.all(10),
                height: 60,
                child: FutureBuilder<void>(
                  future: controller
                      .getCategoryData(), // function where you call your api
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    // AsyncSnapshot<Your object type>
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox();
                    }
                    if (snapshot.hasError)
                      return Center(child: Text('Error: ${snapshot.error}'));
                    else
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller
                              .categoryList.length, //controller._.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CommonWidgets.categoryWidget(
                                controller.categoryList[index]['id'],
                                controller.categoryList[index]['title']);
                          });
                  },
                )),
            FutureBuilder<void>(
              future:
                  controller.getPostData(), // function where you call your api
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                // AsyncSnapshot<Your object type>
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: Center(
                    child: CircularProgressIndicator(),
                  ));
                }
                if (snapshot.hasError)
                  return Center(child: Text('Error: ${snapshot.error}'));
                else
                  return Expanded(
                    child: ListView.builder(
                        itemCount:
                            controller.data.length, //controller._.length,
                        itemBuilder: (BuildContext context, int index) {
                          return 
                          blogPage(
                            code: controller.data[index]['code'],
                            category: controller.data[index]['category']
                                ['title'],
                            title: controller.data[index]['title'],
                            totalLikes:
                                controller.data[index]['totalLikes']==null?"0":controller.data[index]['totalLikes'].toString(),
                            content:
                                controller.data[index]['content'].toString(),
                            ind: index,
                            ismeLike: controller.data[index]['like'],
                          );
                          // ListTile(
                          //   leading: Icon(Icons.list),
                          //   trailing: Text("GFG",
                          //                  style: TextStyle(
                          //                    color: Colors.green,fontSize: 15),),
                          //   title:Text(controller.data[index]['code'])
                          //   );
                        }),
                  );
              },
            )
          ],
        ),
      ),
    );
  }
 
}
