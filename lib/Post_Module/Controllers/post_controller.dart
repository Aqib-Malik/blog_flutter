
import 'package:blog_flutter/Post_Module/Models/Post_Model.dart' hide Category;
import 'package:blog_flutter/Post_Module/Models/cat_model.dart';
import 'package:blog_flutter/controllers/authentication_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api_Services/api_services.dart';

class PostController extends GetxController{
  var isLoading=true.obs;
  var catList=<Category>[].obs;
  var postList=<Post>[].obs;
  
AuthenticationController controller=Get.put(AuthenticationController());
 var usId;
  checkId()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    usId=pref.get("userId");
  }
  @override

  void onInit() {
    fetchPosts();
    
     checkId().whenComplete((){
       controller.getCurrentUserData(usId);
      print(usId);
    });
    super.onInit();
  }
   void fetchPosts()async{
          try{
            isLoading(true);
            var posts=await ApiService.getPostData();
            if(posts!=null){
              postList.assignAll(posts);
            }
            

          }
          finally{
            fetch_cat_List();
            isLoading(false);
          }
         
   }


   void fetch_cat_List()async{
          try{
            isLoading(true);
            var catss=await ApiService.getCategoryData();
            if(catss!=null){
              catList.assignAll(catss);
            }
            print("^^^^^^^^^^^^^^^^^^^^^^");
            print(catss);
          }
          finally{
            isLoading(false);
          }
         
   }
}