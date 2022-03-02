import 'package:blog_flutter/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPost extends StatefulWidget {
  const DetailPost(
      {Key? key,
      this.code,
      this.category,
      this.content,
      this.title,
      this.totalLikes,
      this.ind,
      this.ismeLike})
      : super(key: key);
  final code;
  final title;
  final content;
  final category;
  final totalLikes;
  final ind;
  final ismeLike;

  @override
  State<DetailPost> createState() => _DetailPostState();
}

class _DetailPostState extends State<DetailPost> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListTile(
                   
                    title: Text(widget.title.toString()),
                    subtitle: Text(
                      // dateNoww.toString()
                      widget.category.toString(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.content.toString(),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                color: Colors.blue,
                child: Center(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${widget.code}",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 10.0, bottom: 10.0, right: 10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child:widget.ismeLike==false? Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.red,
                            ):Icon(
                              Icons.favorite_sharp,
                              color:Colors.red,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              controller.isCommentShow.value =
                                  !controller.isCommentShow.value;
                            },
                            child: Icon(
                              Icons.comment_sharp,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text("${widget.totalLikes} Likes")),
                  ),
                ],
              ),
              Obx(() => controller.isCommentShow == true
                  ? SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(hintText: "Comment..."),
                            ),
                            widget.ind!=null?
                            Container(
                              height: 150,
                              child: ListView.builder(
                                  itemCount:
                                      controller.data[widget.ind]['comment'].length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Card(
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ListTile(
                                              //leading: Text("Send by "+controller.data[widget.ind]['comment'][index]['user']['username']),
                                              title: Text(
                                                  controller.data[widget.ind]
                                                      ['comment'][index]['title']),
                                                      subtitle: Text("Send by "+controller.data[widget.ind]['comment'][index]['user']['username']+" in "+controller.data[widget.ind]['comment'][index]['time']),
                                            )));
                                  }),
                            ):SizedBox()
                          ],
                        ),
                      ),
                    )
                  : SizedBox()),
            ],
          ),
        ),
      ),
    ));
  }
}
