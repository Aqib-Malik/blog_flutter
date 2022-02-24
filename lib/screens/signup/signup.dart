import 'dart:io';
import 'package:blog_flutter/controllers/authentication_controller.dart';
import 'package:blog_flutter/imageMethods/image_methods.dart';
import 'package:blog_flutter/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Signup extends StatefulWidget {
  const Signup({key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
    File? _image;

  AuthenticationController controller=Get.put(AuthenticationController());
  TextEditingController _usernamecontroller = new TextEditingController();
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passcontroller = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: kPrimaryLightColor,
      body: SafeArea(
        child: Container(

          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AspectRatio(
                      aspectRatio: 600 / 451,
                      child: Container(
                        height: 20.h,
                        width: 50.w,
                        decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: FractionalOffset.topCenter,
                image: new NetworkImage('https://image.shutterstock.com/image-vector/new-user-online-registration-sign-260nw-1982734163.jpg'),
              )
            ),
                        // child: Image.network("https://image.shutterstock.com/image-vector/new-user-online-registration-sign-260nw-1982734163.jpg",
                        // height: 40.h,
                        // width: 40.h,
                        // fit: BoxFit.fitHeight),
                      ),
                    ),
                  ),
                     SizedBox(
                    height: 23,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _image == null
                          ? ClipOval(
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.blue,
                              ),
                            )
                          : ClipOval(
                              child: Image.file(
                                _image!,
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),

                      // : ClipOval(
                      //     child: Image.file(
                      //       context.read<AccountProvider>().img,
                      //       width: 90,
                      //       height: 90,
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      //radius: 40,
                      //),
                      //),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: () async {},
                          child: Material(
                            child: InkWell(
                              onTap: () async {
                               _image = await ImageMethods.getImage();
                               
                                setState(() {
                                  _image = _image;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.upload,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    " Upload image",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          color: Colors.white,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                 
                  SizedBox(
                    height: 23,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'must enter user name';
                              }
                              return null;
                            },
                            controller: _usernamecontroller,
                            //onChanged: onChanged,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: '        Name',
                              suffix: Icon(Icons.account_box),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              hintStyle: TextStyle(
                                color: Color(0xff8ad2d5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'must enter email address';
                              }
                              return null;
                            },
                            controller: _emailcontroller,
                            //onChanged: onChanged,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: '        Email',
                              suffix: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              hintStyle: TextStyle(
                                color: Color(0xff8ad2d5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'must enter password';
                              }
                              if (value.length<8) {
                                return 'Password should b 8 characters!!';
                              }
                              return null;
                            },
                            controller: _passcontroller,
                            obscureText: true,
                            //onChanged: onChanged,
                            cursorColor: Colors.black,

                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: '        Password',
                              suffix: InkWell(
                                  onTap: () {}, child: Icon(Icons.visibility)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              hintStyle: TextStyle(
                                color: Color(0xff8ad2d5),
                              ),
                            ),
                          ),
                          // TextFormField(
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27),
                    child: SizedBox(
                      height: .5,
                      width: 310,
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Color(0xffc5cbd0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.7,

                    //size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          //color: Color(0xFF6F35A5), //(0xFF6F35A5),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                                   controller.cretate_user_api(_usernamecontroller.text,_emailcontroller.text,_passcontroller.text,_image!);
                                   

                            }
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      "Already have an Account? Sign in",
                      style: TextStyle(color: Colors.amber,fontSize: 15.sp),
                    ),
                    onPressed: () {
                      Get.to(Login());
                    },
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
