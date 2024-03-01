import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test/Mycontroller.dart';

class AddContact extends StatelessWidget {
  //var controller;
  AddContact({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final controller = Get.find<Mycontroller>();
  @override
  Widget build(BuildContext context) {
    // isko upar likte hi galat ho ja rha h
    return Scaffold(
        appBar: AppBar(
          title: Text('Add new Contact'),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name:',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Contact Number:',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  controller: contactController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter your contact number',
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    String name = nameController.text;
                    String contact = contactController.text;

                    Contact newContact = Contact(
                        displayName: name,
                        phones: [Item(value: contact.toString())]);

                    await controller.addNewContact(newContact);
                    controller.rxContacts.refresh();
                    print('contact added');
                  },
                  child: Text('Add contact'),
                )
              ],
            )));
  }
}
