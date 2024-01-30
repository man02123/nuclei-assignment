import 'dart:io';
import 'class.dart';
import 'functions.dart';

void main(){


while(true){
  
  takeValidInputFromUser();  // take valid input from user

  printOptions();          //  give user option to enter an option of corrosponding type

  while(validateIndex(index1) == false){
     print(' \nINVALID CHOICE :plz enter a valid choice');       // validating the index
     print('\n');
     printOptions();

  }

  var object = Item(price: price, itemName: name, quantity: quantity, t1: type.values[index1]);   // creating the object {of ite type}
  double? finalPrice=  object.priceCalculation();      // calculating the final price for the item
  
  print('item name' + '  ${object.itemName}');
  print('item price' + '  ${finalPrice}');

  currentItems.add(object);                       // storing the item to a list so that user can see the previous items

  print('do you want to see previous item? (y/n)');
  String option1 = stdin.readLineSync()!;
  if(option1 == 'y'){                               // option for the user to see the prevoius items
   showPreviousItems();
  }


  print('do you want to add more item? (y/n)');     // option for users to add another items
  String option = stdin.readLineSync()!;

  if(!addMoreItem(option))
  break;
  
 }
}


// doubt (what if it enters the invalid option 2 times try catch will validate only once) // fundamentally changes;

// 