import 'package:blog_flutter/controllers/authentication_controller.dart';
import 'package:blog_flutter/screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  const Login({key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthenticationController controller=Get.put(AuthenticationController());
  TextEditingController _usernamecontroller = new TextEditingController();
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
                    child: GestureDetector(
                      onTap: () async {
                        
                      },
                      child: Container(
                        child: Image(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmApbizrJhcDjhPh_iRJ4cTvE9YJicE_nglg&usqp=CAU')),
                        height: 40.h,
                        width: 70.w,

                        // child: Image.network("https://image.shutterstock.com/image-vector/new-user-online-registration-sign-260nw-1982734163.jpg",
                        // height: 40.h,
                        // width: 40.h,
                        // fit: BoxFit.fitHeight),
                      ),
                    ),
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'must enter password';
                              }
                              if (value.length < 8) {
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
                              // controller.cretate_user_api(_usernamecontroller.text,_emailcontroller.text,_passcontroller.text);
                              controller.login_user_api(
                                  _usernamecontroller.text,
                                  _passcontroller.text);
                            }
                          },
                          child: Text(
                            "Log In",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      "Create Account? Sign Up",
                      style: TextStyle(color: Colors.amber, fontSize: 15.sp),
                    ),
                    onPressed: () {
                      Get.to(Signup());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
