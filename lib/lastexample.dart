import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/ProductModel.dart';
class LastExample extends StatefulWidget {
  const LastExample({super.key});

  @override
  State<LastExample> createState() => _LastExampleState();
}

class _LastExampleState extends State<LastExample> {

  Future<ProductModel> getApis () async{
    final response = await http.get(Uri.parse('https://webhook.site/61a6f442-6d8b-48e6-a6ea-4d7ba84fcc72'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return ProductModel.fromJson(data);
    }
    else{
      return ProductModel.fromJson(data);
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complex Json'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<ProductModel>(
                future: getApis(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 1,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data!.data![index].images!.length,
                                    itemBuilder: (context, position){
                                      return Container(
                                        height: MediaQuery.of(context).size.height * 0.25,
                                        width: MediaQuery.of(context).size.width * .5,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(snapshot.data!.data![index].images![position].url.toString()),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              ListTile(
                                title: Text(snapshot.data!.data![index].shop!.name.toString()),
                                subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                                ),
                              ),
                              Text(snapshot.data!.data![index].categories!.sId.toString()),
                              Icon(snapshot.data!.data![index].inWishlist == false ? Icons.favorite : Icons.favorite_border_outlined),


                            ],
                          );
                        });

                  }
                  else{
                    return Text('Loading');
                  }
                },
              )),

        ],
      ),
    );
  }
}
