import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PeriodicRequester extends StatelessWidget {
Stream<http.Response> getRandomNumberFact() async* {
    yield* Stream.periodic(Duration(seconds: 5), (_) {
      return http.get(Uri.parse("https://blogappdej.herokuapp.com/cat/category/"));
    }).asyncMap((event) async => await event);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<http.Response>(
        stream: getRandomNumberFact(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var rec=jsonDecode(snapshot.data!.body);
                return ListView.builder(
                          itemCount: rec.length,//snapshot.data!.body.length,
                              //.categoryList.length, //controller._.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                      child: ListTile(
                        onTap: (){
                        },
                        leading: Text(rec[index]['id'].toString()),
                         title: Text(rec[index]['title'].toString().toString()),
                        
                      ),
                    );
                          });
        }
        else{
           return Center(child: CircularProgressIndicator());
        }
        }
        
      ),
    );
  }
}






// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class PeriodicRequester extends StatelessWidget {
//   // Stream<http.Response> getRandomNumberFact() async* {
//   //   yield* Stream.periodic(Duration(seconds: 5), (_) {
//   //     return http.get(Uri.parse("https://blogappdej.herokuapp.com/cat/category/"));
//   //   }).asyncMap((event) async => await event);
//   // }
// Stream<http.Response> getRandomNumberFact() async* {
//     yield* Stream.periodic(Duration(seconds: 5), (_) {
//       return http.get(Uri.parse("https://blogappdej.herokuapp.com/cat/category/"));
//     }).asyncMap((event) async => await event);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<http.Response>(
//         stream: getRandomNumberFact(),
//         builder: (context, snapshot) {
//           if(snapshot.hasData){
//                 return ListView.builder(
//                           itemCount: jsonDecode(snapshot.data!.body).length,//snapshot.data!.body.length,
//                               //.categoryList.length, //controller._.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Card(
//                       child: ListTile(
//                         onTap: (){
//                         },
//                         leading: Text(jsonDecode(snapshot.data!.body)[index]['id'].toString()),
//                          title: Text(jsonDecode(snapshot.data!.body)[index]['title'].toString()),
//                         // subtitle: Text(data![index]['address']),
//                         // trailing: RaisedButton.icon(onPressed: (){
//                         //   print(data![index]['id']);
//                         //   _deleteData(data![index]['id']);
//                        // }, icon: Icon(Icons.delete), label: Text("Delete")),
//                       ),
//                     );
//                             //Center(child: Text(jsonDecode(snapshot.data!.body)[index]['id'].toString(),style: TextStyle(color: Colors.amber),));
//                           });
//                 // Center(child: 
//                 // Text(snapshot.data!.body));
//         }
//         else{
//            return Center(child: CircularProgressIndicator());
//         }
//         }
//         //=> 
//         //snapshot.hasData
//         //     ? Center(child: Text(snapshot.data!.body))
//         //     : Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }