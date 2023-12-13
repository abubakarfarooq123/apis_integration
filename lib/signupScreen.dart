import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  
  void loginapi (String email, String password) async{

    try{

      Response response = await post(Uri.parse('https://reqres.in/api/register'),
          body: {
            'email': email,
            'password':password,
          }
      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data['token']);

        print('SignUp Successfully');
      }
      else{
        print('SignUp Failed');
      }
    }catch(e){
      print(e.toString());
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: (){
                loginapi(emailController.text.toString(), passwordController.text.toString());

              },
              child: Container(
                height: 50,
                width: 270,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(
                    child: Text("Sign Up",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
