import 'package:blog_flutter/Models/current_user.dart';
import 'package:blog_flutter/common_widgets/CommonWidgets.dart';
import 'package:blog_flutter/controllers/authentication_controller.dart';
import 'package:blog_flutter/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Drawerr extends StatefulWidget {
  const Drawerr({Key? key}) : super(key: key);

  @override
  _DrawerrState createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
    AuthenticationController _authenticationController =Get.put(AuthenticationController());


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      color: Colors.white,
      child: Column(children: <Widget>[
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            accountName: Text(currentUser.name.toString()),
            accountEmail: Text(currentUser.email.toString()),
            currentAccountPicture:  currentUser.image ==
                  ""
              ? CircleAvatar(
                  child: ClipOval(
                    child: Icon(Icons.person),
                  ),
                )
              : GestureDetector(
                  onTap: () async {},
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image(image: NetworkImage(currentUser.image.toString()),)
                    ),
                  ),
                ),
        ),
      
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 0,
            child: ListTile(
              onTap: () {
                Get.back();
              },
              leading: Icon(
                Icons.home,
                color: Colors.orange,
              ),
              title: Text("Home"),
              trailing: Icon(
                Icons.navigate_next,
              ),
            ),
          ),
        ),
        
        Divider(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 0,
            child: ListTile(
              onTap: () {
               CommonWidgets.confirmBox("Log out", "Are you sure you wanna Logout?", () {
                 _authenticationController.logout();
                });
               
              },
              leading: Icon(
                Icons.logout,
                color: Colors.redAccent,
              ),
              title: Text("Log out"),
              trailing: Icon(
                Icons.navigate_next,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
