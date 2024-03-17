import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:test/views/contact_screen/contact_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    //check();
  }

  void write() async {
    var box = await Hive.openBox('myBox');
    box.put('p1', 'maneesh');
    print('successfully written');
  }

  void read() async {
    var box = await Hive.openBox('myBox');
    var data = box.get('p1');
    print(data);
  }

  void delete() async {
    var box = await Hive.openBox('myBox');
    box.delete('p1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Contact App',
          style: TextStyle(color: Colors.lime, fontSize: 30),
        ),
      ),
      body: ContactScreen(),
    );
  }
}
