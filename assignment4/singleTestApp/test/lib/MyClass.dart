import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test/Mycontroller.dart';
import 'package:test/detail_screen.dart';
import 'package:test/new_contact.dart';

import 'SearchedItem.dart';

// statelesss bana k use future builder(no stateful widget)

class MyClass extends StatelessWidget {
  MyClass({super.key});
  var controller = Get.put(Mycontroller());
  @override
  Widget build(BuildContext context) {
    String value = '';
    final TextEditingController searchController = TextEditingController();
    return FutureBuilder(
        future: controller
            .getContact(), // yahi h injection ab mera controller is file me aa gya(imp)
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        // sidhe controller hi pass kr lunga
                        context,
                        MaterialPageRoute(builder: (context) => AddContact()),
                      );
                    },
                    child: const Text('Add')),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'search',
                            suffixIcon: ElevatedButton(
                                onPressed: () async {
                                  value = searchController.text;
                                  Future<Iterable<Contact>> contactsFuture =
                                      controller.queryContact(value);

                                  Iterable<Contact> contacts =
                                      await contactsFuture;
                                  List<Contact> contact = [];
                                  for (var currentContact in contacts)
                                    contact.add(currentContact);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        //(named route use krna)
                                        builder: (
                                      context, // router se data pass karao
                                    ) =>
                                            SearchedItem(contacts: contact)),
                                  );
                                },
                                child: Icon(Icons.search)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => ListView.builder(
                      // (bhut important concept hai gesture consume hone ka isme)
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.rxContacts
                          .length, // (yaha pe value ni likha to bhi kam kega not for alwa)
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ContactDetails(index: index);
                            }));

                            //print('tapped');
                          },
                          child: ListTile(
                            trailing: Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.deleteContact(index);
                                },
                                child: Text('Delete'),
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
                                '${controller.rxContacts.value[index].displayName?[0]} ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'poppins',
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ),
                            title: Text(
                              '${controller.rxContacts.value[index].displayName ?? "no name"}',
                              maxLines: 1, // overflow na ho jaye line ka
                              overflow:
                                  TextOverflow.ellipsis, // pata ni kya karta h
                              style: TextStyle(
                                  fontFamily: 'italic',
                                  fontSize: 25,
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              '${controller.rxContacts[index].phones?[0].value ?? '00'}',
                              style: TextStyle(
                                fontFamily: 'bold',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}
