import 'package:flutter/material.dart';
import 'package:test/views/contact_screen/contact_screen.dart';
import 'package:test/views/new_contact_screen/new_contact.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (
              context,
            ) =>
                    AddNewContact()),
          );
        },
        child: const Text('add'),
      ),
      body: ContactScreen(),
    );
  }
}
