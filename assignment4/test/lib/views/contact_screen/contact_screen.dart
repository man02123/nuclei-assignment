import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test/controller/getx_controller.dart';
import 'package:test/views/detail_screen/detail_screen.dart';
import 'package:test/views/new_contact_screen/new_contact.dart';
import 'package:test/views/search_screen/SearchedItem.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});
  var controller = Get.put(Mycontroller());
  String value = '';
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return FutureBuilder(
        future: controller.getContact(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
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
                                  controller.searcContact(value);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (
                                      context,
                                    ) =>
                                            SearchedItem(
                                                contacts:
                                                    controller.query_Contacts)),
                                  );
                                },
                                child: const Icon(Icons.search)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddNewContact()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.rxContacts.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ContactDetails(index: index);
                            }));
                          },
                          child: ListTile(
                            trailing: ElevatedButton(
                              onPressed: () {
                                controller.deleteContact(index);
                              },
                              child: const Icon(Icons.delete),
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(1.0),
                                  offset: const Offset(3, 3),
                                )
                              ], borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    top: 5, start: 8),
                                child: Text(
                                  '${controller.rxContacts[index].displayName?[0]} ${controller.rxContacts[index].familyName?[0] ?? 'N'} ',
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
                              controller.rxContacts[index].displayName ??
                                  "no name",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontFamily: 'italic',
                                  fontSize: 25,
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              controller.rxContacts[index].phones?[0].value ??
                                  '00',
                              style: const TextStyle(
                                  fontFamily: 'bold',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.grey),
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
