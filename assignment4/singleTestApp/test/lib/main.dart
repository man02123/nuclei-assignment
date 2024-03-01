import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test/MyClass.dart';
import 'package:test/contact_layout.dart';

import 'HIVETESTING.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Contact App',
            style: TextStyle(color: Colors.lime, fontSize: 30),
          ),
        ),
        body: MyClass(),
      ),
    );
  }
}
