import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({ Key? key }) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  void showAlert(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text("hi"),
              ));
    }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: InkWell(
        onTap: (){
          showAlert(context);
        },
        child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.yellow,
              
            ),
          ),
      ),
    );
  }
}