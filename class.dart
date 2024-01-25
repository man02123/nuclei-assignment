import 'functions.dart';

enum type{
  raw , manufactured , imported
}

class Item{      // class of item whoose price need to be calculated
  int price;
  String itemName ;
  int quantity; 
  type t1;  // used a enum here to track the type of item
       

  Item({required this. price , required this.itemName , required this.quantity , required this.t1}) ;  // constructor can accept argument in any order

  
 double priceCalculation(){          /// modified logic
      return priceCalculationOfItems(this.t1, this.price, this.quantity);
 }
}


