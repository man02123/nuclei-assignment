import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class Mycontroller extends GetxController {
  RxList<Contact> rxContacts = <Contact>[].obs;
  RxList<Contact> query_Contacts = <Contact>[].obs;

  Future<void> checkPermission() async {
    var status = await Permission.contacts.status;

    if (status.isGranted) {
      print('granted');
    } else {
      await Permission.contacts.request();
    }
  }

  Future<void> updateContact(contact) async {
    await ContactsService.updateContact(contact);
  }

  Future<void> addNewContacthelper(String? name, String? contact) async {
    Contact newContact = Contact(
        displayName: name,
        givenName: name,
        phones: [Item(value: contact.toString())]);

    await addNewContact(newContact);
    rxContacts.refresh();
  }

  Future<void> addNewContact(Contact newContact) async {
    rxContacts.add(newContact);
    await ContactsService.addContact(newContact);
    rxContacts.refresh();
  }

  Future<Iterable<Contact>> queryContact(name) async {
    Iterable<Contact> contacts = await ContactsService.getContacts(query: name);
    return contacts;
  }

  Future<void> getContact() async {
    rxContacts = (await ContactsService.getContacts()).obs;
  }

  Future<void> deleteContact(index) async {
    await ContactsService.deleteContact(rxContacts[index]);
    rxContacts.remove(rxContacts[index]);
    rxContacts.refresh();
  }

  Future<void> searcContact(String? value) async {
    Future<Iterable<Contact>> contactsFuture = queryContact(value);

    Iterable<Contact> contacts = await contactsFuture;

    List<Contact> contact = [];
    query_Contacts.clear();
    for (var currentContact in contacts) {
      query_Contacts.add(currentContact);
    }
  }
}
