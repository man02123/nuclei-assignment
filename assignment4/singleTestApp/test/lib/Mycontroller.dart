import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class Mycontroller extends GetxController {
  RxList<Contact> rxContacts =
      <Contact>[].obs; // (ye method se familiar ho jaun )

  Future<void> check() async {
    var status = await Permission
        .contacts.status; // manually band krne pe error hai (solve??)

    if (status.isGranted) {
      print('granted');
    } else
      await Permission.contacts.request();
  }

  Future<void> updateContact(contact) async {
    await ContactsService.updateContact(contact);
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
    var t = (await ContactsService.getContacts());
    rxContacts = t.obs;
  }

  @override
  void onInit() async {
    print('initialized');
    super.onInit();
    await check();
    await getContact();
  }

  Future<void> deleteContact(index) async {
    await ContactsService.deleteContact(rxContacts.value[index]);

    rxContacts.value.remove(rxContacts.value[index]);

    rxContacts
        .refresh(); //( kabhi kabhi obx sahi se kam ni krta hai even in the main project isse error aya tha)
  }
}
