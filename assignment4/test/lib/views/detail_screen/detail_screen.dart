import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/getx_controller.dart';

class ContactDetails extends StatelessWidget {
  int index;
  ContactDetails({super.key, required this.index});
  final controller = Get.find<Mycontroller>();
  TextEditingController nameController = TextEditingController(),
      lastNameController = TextEditingController(),
      contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController =
        TextEditingController(text: controller.rxContacts[index].displayName);
    lastNameController = TextEditingController(
        text: controller.rxContacts[index].familyName ?? 'NA');
    contactController = TextEditingController(
        text: controller.rxContacts[index].phones?[0].value);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact Details'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Name:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: '${controller.rxContacts[index].displayName}',
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
              decoration: InputDecoration(
                hintText: '${controller.rxContacts[index].phones?[0].value}',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Last Name:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: lastNameController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: controller.rxContacts[index].familyName ?? 'NA',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 140, top: 50),
              child: ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String contactVal = contactController.text;
                  String lastName = lastNameController.text;
                  Contact contact = Contact(
                      displayName: name,
                      givenName: name,
                      phones: [Item(value: contactVal)],
                      familyName: lastName);
                  contact.identifier =
                      controller.rxContacts[index].givenName = name;
                  controller.rxContacts[index].givenName = name;
                  controller.rxContacts[index].displayName = name;
                  controller.rxContacts[index].phones?[0].value = contactVal;
                  controller.rxContacts[index].familyName = lastName;
                  controller.rxContacts.refresh();
                  controller.updateContact(contact);
                },
                style: const ButtonStyle(
                  alignment: AlignmentDirectional.center,
                ),
                child: const Text('Save'),
              ),
            ),
          ]),
        ));
    ;
  }
}
