import 'dart:io';
import 'package:blog_flutter/controllers/authentication_controller.dart';
import 'package:blog_flutter/imageMethods/image_methods.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
class ImageTesting extends StatefulWidget {
  const ImageTesting({ Key? key }) : super(key: key);

  @override
  _ImageTestingState createState() => _ImageTestingState();
}

class _ImageTestingState extends State<ImageTesting> {
  AuthenticationController controller=Get.put(AuthenticationController());
  File? image;
  //  File? image; 
  //  final _picker=ImagePicker();
  // Future Getimage()async{
  //   final pickedFile=await _picker.getImage(source: ImageSource.gallery);
  //   if(pickedFile!=null){
  //     image=File(pickedFile.path);
  //     setState(() {
        
  //     });}
  //   else{
  //         print("No umage Selected");
  //   }
    

  // }
//  _uploadImge()async{
//    var formData=FormData.fromMap(
//       {
//         'Image':await MultipartFile.fromFile(image!.path),
//       }
//    );
//    var res=await Dio().post("http://10.0.2.2:8000/cat/image/",data:formData);
//    print(res.statusCode);
//    print(res);
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Image Upload"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          InkWell(
            onTap: ()async{
              //Getimage();
               image = await ImageMethods.getImage();
                                setState(() {
                                  image = image;
                                });
            },
            child: Container(
              child:
              image==null?Text("Choose image"):Image.file(File(image!.path).absolute,height: 100,width: 100,fit: BoxFit.cover,)
          
            ),
          ),
          SizedBox(height: 30,),
          RaisedButton(onPressed: (){
            //_uploadImge();
            controller.uploadImge(image,2);
          },child: Text("Upload Image"),),
           SizedBox(height: 30,),
          RaisedButton(onPressed: (){
          },child: Text("Create user"),)
        ],),
      ),
    );
  }
}