import 'dart:io';
import 'class.dart';
import 'util.dart';

void main() {
  while (true) {
    Util.takeValidInputFromUser(); // take valid input from user

    int userChoice = Util.takeValidChoice();

    Item item = Item(ItemType.values[userChoice], Util.name, Util.price,
        Util.quantity); // creating the object {of ite type}
    double finalPrice =
        item.calculateItemPrice(); // calculating the final price for the item

    print(' ${item.toString()}');

    Item.currentItems.add(
        item); // storing the item to a list so that user can see the previous items

    print('do you want to see previous item? (y/n)');
    String option1 = stdin.readLineSync()!;
    if (option1 == 'y') {
      // option for the user to see the prevoius items
      Item.showPreviousItems();
    }

    print(
        'do you want to add more item? (y/n)'); // option for users to add another items
    String option = stdin.readLineSync()!;

    if (!Util.addMoreItem(option)) break;
  }
}
