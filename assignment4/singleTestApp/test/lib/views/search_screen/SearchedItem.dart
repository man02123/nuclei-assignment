import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/getx_controller.dart';
import '../detail_screen/detail_screen.dart';

class SearchedItem extends StatefulWidget {
  List<Contact> contacts;
  SearchedItem({super.key, required this.contacts});

  @override
  State<SearchedItem> createState() => _SearchedItemState();
}

class _SearchedItemState extends State<SearchedItem> {
  final controller = Get.find<Mycontroller>();
  _SearchedItemState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Contact '),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.query_Contacts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //print('${controller.query_Contacts.length}');

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        int contactIndex = -1;
                        for (var contact in controller.rxContacts) {
                          if (contact.identifier ==
                              controller.query_Contacts[index].identifier) {
                            contactIndex = index;
                          }
                        }
                        print(contactIndex);
                        return ContactDetails(index: contactIndex);
                      },
                    ));

                    //print('tapped');
                  },
                  child: ListTile(
                    trailing: Container(
                      child: ElevatedButton(
                        onPressed: () async {
                          int contactIndex = -1;
                          for (var contact in controller.rxContacts) {
                            if (contact.identifier ==
                                controller.query_Contacts[index].identifier) {
                              contactIndex = index;
                              controller.query_Contacts.remove(contact);
                              controller.query_Contacts.refresh();
                            }
                          }
                          await controller.deleteContact(contactIndex);
                        },
                        child: Text('${controller.query_Contacts.length}'),
                      ),
                    ),
                    leading: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          blurRadius: 3,
                          offset: const Offset(3, 3),
                        )
                      ], borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        '${controller.query_Contacts[index].displayName?[0]} ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppins',
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                    title: Text(
                      controller.query_Contacts[index].displayName ?? "no name",
                      maxLines: 1, // overflow na ho jaye line ka
                      overflow: TextOverflow.ellipsis, // pata ni kya karta h
                      style: const TextStyle(
                          fontFamily: 'italic',
                          fontSize: 25,
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      controller.query_Contacts[index].phones?[0].value ?? '00',
                      style: const TextStyle(
                        fontFamily: 'bold',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              }),
        ])));
  }
}
