// ignore_for_file: avoid_print

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageServices {
  
  ///****upload account pic on firebase Storage******/
  static Future<String?> uploadUserImage(_image, email) async {
    try{
    var imagestatus = await FirebaseStorage.instance
        .ref()
        .child('images')
        .child(email+".jpg")
        .putFile(_image) //await StorageFirebaseServices.getImage())
        .then((value) => value);
    String imageUrl = await imagestatus.ref.getDownloadURL();
    return imageUrl;
    }catch(e){
      print(e);
      return "null";
    }
  }

  
}