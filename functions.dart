import 'class.dart';

bool validateIndex(int ind){                  // for index valuation while accrssing the enum type                                             //
 
  if(ind < 0 || ind  >=3)return false;
  return true;

}

bool addMoreItem(String? option){           // asking  the user for more choices 
  if(option !='n'  && option !='y'){
    print('Invalid choice by the User');
  }
  return (option == 'y'); 
}


void printOptions(){                  // show ooption to the user for more choices
  print('enter the type of item');
  print('0 :for raw');
  print('1:for manufactured');
  print('2 :for imported');
}

double priceCalculationOfItems (type t1 , int price , int quantity){

    double currPrice = 0;
    switch(t1){

      case type.raw :{ currPrice = (0.125*price)*quantity  + price*quantity;}break;    // pricer of raw item type
      case type.manufactured : {         // price of manufactured type
        double p1 = (0.125*price)*quantity ;
        currPrice = (0.02*p1) + p1 + price*quantity;  
      }break;

      case type.imported :{                                                                   // price of imported item type
        double imported = (0.10 * price)*quantity +price*quantity;

          if( imported <= 100){
            imported += 5;
          }
          else{if( imported >100 && imported <= 200){
            imported += 10;
          }
          else if(imported > 200){
            imported = (0.10*imported) + imported;
          }

          currPrice =  imported;
      }
    }break;
     
    default:{currPrice = 0;}
     break;

    }
    return currPrice;
 }


