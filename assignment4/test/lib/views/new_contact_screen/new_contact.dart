import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/getx_controller.dart';

class AddNewContact extends StatelessWidget {
  AddNewContact({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final controller = Get.find<Mycontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add new Contact'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name:',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Contact Number:',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  controller: contactController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Enter your contact number',
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    String name = nameController.text;
                    String contact = contactController.text;

                    Contact newContact = Contact(
                        displayName: name,
                        givenName: name,
                        phones: [Item(value: contact.toString())]);

                    await controller.addNewContact(newContact);
                    controller.rxContacts.refresh();
                    print('contact added');
                  },
                  child: const Text('Add contact'),
                )
              ],
            )));
  }
}
