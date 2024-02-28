import 'dart:io';
import 'class.dart';

class Util {
  static int price = 0, quantity = 0;
  static String name = "";

  static int takeValidChoice() {
    print('enter the type of item');
    print('0 :for raw');
    print('1:for manufactured');
    print('2 :for imported');

    bool isValid = false;
    int validIndex = 0;
    while (!isValid && (validIndex < 0 || validIndex >= 3)) {
      try {
        validIndex = int.parse(stdin.readLineSync()!);
        isValid = true;
      } catch (e) {
        print("INVALID INPUT PLZ ENTER AN INTEGER RANGING (0-2)");
        isValid = false;
      }
    }
    return validIndex;
  }

  static bool addMoreItem(String? option) {
    // asking  the user for more choices
    if (option != 'n' && option != 'y') {
      print('Invalid choice by the User');
    }
    return (option == 'y');
  }

  static void takeValidInputFromUser() {
    // reading the valid input from the user and validating it

    bool validPrice = false, validQuantity = false;

    while (!validPrice) {
      try {
        print('enter the price of item');
        price = int.parse(stdin.readLineSync()!);

        validPrice = true;
      } catch (e) {
        print("INVALID INPUT PLZ ENTER  AN INTEGER");
        validPrice = false;
      }
    }

    print('enter the name of item');
    name = stdin.readLineSync()!;

    while (!validQuantity) {
      try {
        print('enter the quantiity of item');
        quantity = int.parse(stdin.readLineSync()!);
        validQuantity = true;
      } catch (e) {
        print("INVALID INPUT PLZ ENTER  AN INTEGER");
        validQuantity = false;
      }
    }
  }

  static void showPreviousItems() {
    // showing the previous inputs
    for (int i = 0; i < Item.currentItems.length; i++) {
      print('${Item.currentItems[i].toString()}');
    }
  }
}
