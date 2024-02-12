import 'dart:io';
import 'class.dart';
import 'util.dart';

void main() {
  while (true) {
    Util.takeValidInputFromUser(); // take valid input from user

    Util.printOptions(); //  give user option to enter an option of corrosponding type

    while (Util.validateIndex(Util.index1) == false) {
      print(
          ' \nINVALID CHOICE :plz enter a valid choice'); // validating the index
      print('\n');
      Util.printOptions();
    }

    var object = Item(Type.values[Util.index1], Util.name, Util.price,
        Util.quantity); // creating the object {of ite type}
    double finalPrice =
        object.priceCalculation(); // calculating the final price for the item

    print('item name   ${Util.name}');
    print('item price  ${finalPrice}');

    Item.currentItems.add(
        object); // storing the item to a list so that user can see the previous items

    print('do you want to see previous item? (y/n)');
    String option1 = stdin.readLineSync()!;
    if (option1 == 'y') {
      // option for the user to see the prevoius items
      Util.showPreviousItems();
    }

    print(
        'do you want to add more item? (y/n)'); // option for users to add another items
    String option = stdin.readLineSync()!;

    if (!Util.addMoreItem(option)) break;
  }
}
