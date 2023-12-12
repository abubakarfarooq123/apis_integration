import 'dart:convert';

import 'package:apis_integration/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> {
  
  List<UserModel> userdata =[];
  
  Future<List<UserModel>> getUserData() async{
    
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200) {
      for (Map i in data){
        userdata.add(UserModel.fromJson(i));
      }
      return userdata;
  }
    else{
    return userdata;
    }

  } 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Data",style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUserData(),
                builder: (context,AsyncSnapshot<List<UserModel>> snapshot){
                  return ListView.builder(
                    itemCount: userdata.length,
                      itemBuilder: (context ,index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ReuseableRow(title: snapshot.data![index].name.toString(), val: 'Name'),
                                  ReuseableRow(title: snapshot.data![index].address.geo.lat.toString(), val: 'Geo'),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
              )
          ),
        ],
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {

  String val, title;

   ReuseableRow({super.key, required this.title, required this.val});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(val),
        Text(title),
      ],
    );
  }
}

