

enum Type{
  raw , manufactured , imported
}

class Item{      // class of item whoose price need to be calculated
  int itemPrice;
  String itemName ;
  int itemQuantity; 
  Type itemType;  // used a enum here to track the type of item
  static List<Item> currentItems = [];
       

  Item({required this. itemPrice , required this.itemName , required this.itemQuantity , required this.itemType}) ;  // constructor can accept argument in any order

    double priceCalculationOfItems (){

    double currPrice = 0;
    switch(this.itemType){

      case Type.raw :{ currPrice = (0.125*itemPrice)*itemQuantity  + itemPrice*itemQuantity;}break;    // pricer of raw item type
      case Type.manufactured : {         // price of manufactured type
        double p1 = (0.125*itemPrice)*itemQuantity ;
        currPrice = (0.02*p1) + p1 + itemPrice*itemQuantity;  
      }break;

      case Type.imported :{                                                                   // price of imported item type
        double imported = (0.10 * itemPrice)*itemQuantity +itemPrice*itemQuantity;

          if( imported <= 100){
            imported += 5;
          }
          else if( imported >100 && imported <= 200){
            imported += 10;
          }
          else if(imported > 200){
            imported = (0.10*imported) + imported;
          }

          currPrice =  imported;
    }break;
     
    default:{currPrice = 0;}
     break;

    }
    return currPrice;
 }

void showPreviousItems(){                     // showing the previous inputs 
  for(int i =0;i<Item.currentItems.length;i++){
      print(Item.currentItems[i].itemName );
      print( Item.currentItems[i].itemName);
   }
}


}


