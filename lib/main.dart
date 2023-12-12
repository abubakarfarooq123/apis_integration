import 'package:apis_integration/example3.dart';
import 'package:apis_integration/example_2.dart';
import 'package:apis_integration/withoutmodelcomplex.dart';
import 'package:flutter/material.dart';

import 'lastexample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LastExample(),
    );
  }
}

