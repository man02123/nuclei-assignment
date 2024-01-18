import 'dart:io';

enum type{
  raw , manufactured , imported
}

class Item{      // class name shoud be generic
  int price;
  String itemName ;
  int quantity; 
  type t1; 
       // use enum (here)

  Item({required this. price , required this.itemName , required this.quantity , required this.t1}) ;  // can be shortened(redundancy)(done)

  
 double p(){          /// should i replace this logic by switch- case(?) ==>yes have to use switch case
 
    double currPrice = 0;

    if(this.t1 == type.raw){
      currPrice = (0.125*this.price)*this.quantity  + this.price*this.quantity;  
    }
    else if(this.t1 == type.manufactured){
       double p1 = (0.125*this.price)*this.quantity ;
       currPrice = (0.02*p1) + p1 + this.price*this.quantity; 
    }
    else{

       double imported = (0.10 * this.price)*this.quantity +this.price*this.quantity;

       if( imported <= 100){
        imported += 5;
       }
       else{if( imported >100 && imported <= 200){
         imported += 10;
       }
       else if(imported > 200){
         imported = (0.10*imported) + imported;
       }
       currPrice = imported;

    }

 }
 return currPrice;

}
}



void main(){

while(true){
   

  print('enter the price of item');
  int price = int.parse(stdin.readLineSync()!) ; 
  
  print('enter the name of item');
  String name = stdin.readLineSync()!;
  
  print('enter the quantiity of item');
  int quantity = int.parse(stdin.readLineSync()!) ; 

  print('enter the type of item');
  print('0 :for raw');
  print('1:for manufactured');
  print('2 :for imported');

  int index1 = int.parse(stdin.readLineSync()!);

  while(validateIndex(index1) == false){
     print(' \nINVALID CHOICE :plz enter a valid choice');
     print('\n');

     print('enter the type of item');
     print('0 :for raw');
     print('1:for manufactured');
     print('2 :for imported');
     index1 = int.parse(stdin.readLineSync()!);

  }

  



  var object = Item(price: price, itemName: name, quantity: quantity, t1: type.values[index1]);
  double? finalPrice=  object.p();
  
  print('item name' + '  ${object.itemName}');
  print('item price' + '  ${finalPrice}');
  

  print('do you want to add more item? (y/n)');

   String? option = stdin.readLineSync();

   if(option == 'n'){
    break;
   }
   else if(option !='y'){
    print('INVALID INPUT');
    break;
   }
  
  

 }


}
bool validateIndex(int ind){
 
  if(ind < 0 || ind  >=3)return false;
  return true;

}



// done enum +  null safty(ok)