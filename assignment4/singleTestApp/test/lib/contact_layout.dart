import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:permission_handler/permission_handler.dart';

class Contact_layout extends StatefulWidget {
  const Contact_layout({super.key});

  @override
  State<Contact_layout> createState() => _Contact_layoutState();
}

class _Contact_layoutState extends State<Contact_layout> {
  List<Contact> contacts = [];
  Future<void> check() async {
    var status = await Permission
        .contacts.status; // manually band krne pe error hai (solve??)

    if (status.isGranted) {
      print('granted');
    } else
      await Permission.contacts.request();
  }

  Future<void> getContact() async {
    contacts = await ContactsService.getContacts();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    print(contacts.length);
    print(
        "successfully fetched"); // ye line phle chal jayegi bhut dyan se conceot samjho
  }

  // Future<void> chaceData() async {
  //   var box = await Hive.openBox('myBox');
  //
  //   int keys = 0;
  //
  //   for (var currentContact in contacts) {
  //     box.put(keys++, currentContact);
  //   }
  // }

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    check();
    getContact();
    //chaceData();
  }

  Future<void> deleteContact(index) async {
    await ContactsService.deleteContact(contacts[index]);
    contacts.remove(contacts[index]);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'search',
                            suffixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    // (bhut important concept hai gesture consume hone ka isme)
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: Container(
                          child: ElevatedButton(
                            onPressed: () {
                              deleteContact(index);
                              setState(() {
                                print('sucessfully deleted');
                              });
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
                            '${contacts[index].displayName?[0]} ${contacts[index].familyName?[0]} ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins',
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ),
                        title: Text(
                          contacts[index].displayName ?? "no name",
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
                          'phone',
                          //contacts[index].phones![0].value!,
                          style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }),
              ],
            ),
          );
  }
}

// statelesss bana k use future builder(no stateful widget)
