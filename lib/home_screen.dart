import 'dart:convert';

import 'package:flutter/material.dart';
import 'Models/PostsModel.dart';
import 'package:http/http.dart' as http;

import 'Models/postmodel.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PostModel> postlst =[];

  Future<List<PostModel>> getApiPost () async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){

      for (Map i in data) {
        postlst.add(PostModel.fromJson(i as Map<String, dynamic>));
    }
    return postlst;
    }
    else{
      return postlst;

    }
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getApiPost(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text('Loading');
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data?.length, // Use snapshot.data.length instead of postlst.length
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                        Text(snapshot.data![index].title.toString()), // Use snapshot.data[index] instead of postlst[index]
                      Text(snapshot.data![index].body.toString()), // Use snapshot.data[index] instead of postlst[index]
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
