import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'Mycontroller.dart';
import 'detail_screen.dart';

class SearchedItem extends StatefulWidget {
  List<Contact> contacts;
  SearchedItem({super.key, required this.contacts});

  @override
  State<SearchedItem> createState() => _SearchedItemState(contacts: contacts);
}

class _SearchedItemState extends State<SearchedItem> {
  List<Contact> contacts;

  var controller = Get.put(Mycontroller());
  _SearchedItemState({required this.contacts});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search Contact '),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          ListView.builder(
              // (bhut important concept hai gesture consume hone ka isme)
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: contacts
                  .length, // (yaha pe value ni likha to bhi kam kega not for alwa)
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ContactDetails(index: index);
                      },
                    ));

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
                        '${contacts[index].displayName?[0]} ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppins',
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                    title: Text(
                      '${contacts[index].displayName ?? "no name"}',
                      maxLines: 1, // overflow na ho jaye line ka
                      overflow: TextOverflow.ellipsis, // pata ni kya karta h
                      style: TextStyle(
                          fontFamily: 'italic',
                          fontSize: 25,
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      '${contacts[index].phones?[0].value ?? '00'}',
                      style: TextStyle(
                        fontFamily: 'bold',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              })
        ])));
  }
}
