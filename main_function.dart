import 'dart:io';
import 'class.dart';
import 'functions.dart';

void main(){

while(true){
   
  print('enter the price of item');
  int price = int.parse(stdin.readLineSync()!) ; 
  
  print('enter the name of item');
  String name = stdin.readLineSync()!;
  
  print('enter the quantiity of item');
  int quantity = int.parse(stdin.readLineSync()!) ; 

  printOptions();

  int index1 = int.parse(stdin.readLineSync()!);

  while(validateIndex(index1) == false){
     print(' \nINVALID CHOICE :plz enter a valid choice');
     print('\n');

     printOptions();
     index1 = int.parse(stdin.readLineSync()!);

  }

  var object = Item(price: price, itemName: name, quantity: quantity, t1: type.values[index1]);
  double? finalPrice=  object.priceCalculation();
  
  print('item name' + '  ${object.itemName}');
  print('item price' + '  ${finalPrice}');

  

  print('do you want to add more item? (y/n)');
  String? option = stdin.readLineSync();

  if(!addMoreItem(option))
  break;
  
 }
}