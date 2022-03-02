import 'package:blog_flutter/Post_Module/Views/post_screen.dart';
import 'package:blog_flutter/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPost extends StatefulWidget {
  const CategoryPost({ Key? key, }) : super(key: key);


  @override
  State<CategoryPost> createState() => _CategoryPostState();
}

class _CategoryPostState extends State<CategoryPost> {
    HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              controller.getPost_WRT_Category(Get.arguments['cid']);
            },
            child: Text(Get.arguments['title'])),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          FutureBuilder<void>(
            future:
                controller.getPost_WRT_Category(Get.arguments['cid']), // function where you call your api
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
                      itemCount: controller.Postwrtcat.length, //controller._.length,
                      itemBuilder: (BuildContext context, int index) {
                        return 
                        blogPage(
                          code: controller.Postwrtcat[index]['code'],
                          category: controller.Postwrtcat[index]['category']['title'],
                          title: controller.Postwrtcat[index]['title'],
                          totalLikes:
                              controller.Postwrtcat[index]['totalLikes'].toString(),
                          content: controller.Postwrtcat[index]['content'].toString(),
                          ind: index,
                            ismeLike: controller.Postwrtcat[index]['like'],
                        );
                        
                      }),
                );
            },
          )
        ],
      ),
    );
  }
}