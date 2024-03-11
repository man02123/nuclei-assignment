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
          Obx(
            () => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.query_Contacts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //print('${controller.query_Contacts.length}');

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          int contactIndex = 0;
                          for (var contact in controller.rxContacts) {
                            if (contact.identifier ==
                                controller.query_Contacts[index].identifier) {
                              contactIndex = index;
                            }
                          }

                          return ContactDetails(index: contactIndex);
                        },
                      ));

                      //print('tapped');
                    },
                    child: ListTile(
                      trailing: Container(
                        child: ElevatedButton(
                          onPressed: () {
                            int contactIndex = 0;
                            //( set)
                            for (var contact in controller.rxContacts) {
                              if (contact.identifier ==
                                  controller.query_Contacts[index].identifier) {
                                contactIndex = index;
                              }
                            }
                            controller.query_Contacts
                                .remove(controller.query_Contacts[index]);
                            controller.query_Contacts.refresh();

                            controller.deleteContact(contactIndex);
                          },
                          child: Icon(Icons.delete),
                        ),
                      ),
                      leading: Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(1),
                            offset: const Offset(3, 3),
                          )
                        ], borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 5, start: 8),
                          child: Text(
                            '${controller.query_Contacts[index].displayName?[0]} ${controller.rxContacts[index].familyName?[0] ?? 'N'} ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins',
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        controller.query_Contacts[index].displayName ??
                            "no name",
                        maxLines: 1, // overflow na ho jaye line ka
                        overflow: TextOverflow.ellipsis, // pata ni kya karta h
                        style: const TextStyle(
                            fontFamily: 'italic',
                            fontSize: 25,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        controller.query_Contacts[index].phones?[0].value ??
                            '00',
                        style: const TextStyle(
                          fontFamily: 'bold',
                          fontSize: 17,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ])));
  }
}
