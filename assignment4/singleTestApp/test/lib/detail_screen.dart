import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/Mycontroller.dart';

var controller = Get.put(Mycontroller());

class ContactDetails extends StatefulWidget {
  int index;
  ContactDetails({super.key, required this.index});

  @override
  State<ContactDetails> createState() => _ContactDetailsState(index: index);
}

class _ContactDetailsState extends State<ContactDetails> {
  int index;
  _ContactDetailsState({required this.index});

  TextEditingController nameController = TextEditingController(),
      lastNameController = TextEditingController(),
      contactController = TextEditingController();
  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: controller.rxContacts[index].displayName);
    lastNameController = TextEditingController(
        text: controller.rxContacts[index].familyName ?? 'NA');
    contactController = TextEditingController(
        text: controller.rxContacts[index].phones?[0].value);
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Details'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Name:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: '${controller.rxContacts[index].displayName}',
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
                hintText: '${controller.rxContacts[index].phones?[0].value}',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Last Name:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: lastNameController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '${controller.rxContacts[index].familyName ?? 'NA'}',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 100, top: 50),
              child: ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String contactVal = contactController.text;
                  String lastName = lastNameController.text;
                  print(name);
                  Contact contact = Contact(
                      displayName: name,
                      phones: [Item(value: contactVal)],
                      familyName: lastName);
                  controller.rxContacts[index].displayName = name;
                  controller.rxContacts[index].phones?[0].value = contactVal;
                  controller.rxContacts[index].familyName = lastName;
                  controller.rxContacts.refresh();
                  controller.updateContact(controller.rxContacts[index]);
                },
                style: ButtonStyle(
                  alignment: AlignmentDirectional.center,
                ),
                child: Text('Save Changes'),
              ),
            ),
          ]),
        ));
  }
}
