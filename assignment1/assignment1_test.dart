import 'package:test/test.dart';
import 'class.dart';


void main(){
  
  test('i want to test price calculation for raw material' , () {
     
     Item rawItemtoTest = Item(itemName: 'testitem1' , itemPrice: 10,itemQuantity: 5,itemType: Type.raw);
     
     double result = rawItemtoTest.priceCalculationOfItems();

     expect(result,56.25);
     except(result , isNot(56));

  });

  test('i want to test price calculation for imported material: case when price < 100' , () {
     
     Item importedItemToTest = Item(itemName: 'testitem2' , itemPrice: 10,itemQuantity: 5,itemType: Type.raw);
     
     double result = importedItemToTest.priceCalculationOfItems();

     expect(result,60);
     

  });

  test('i want to test price calculation for imported material: case when price > 100 && price <= 200' , () {
     
     Item importedItemToTest = Item(itemName: 'testitem3' , itemPrice: 10,itemQuantity: 10,itemType: Type.raw);
     
     double result = importedItemToTest.priceCalculationOfItems();

     expect(result,120);
     

  });

   test('i want to test price calculation for imported material: case when price > 200' , () {
     
     Item importedItemToTest = Item(itemName: 'testitem4' , itemPrice: 10,itemQuantity: 20,itemType: Type.raw);
     
     double result = importedItemToTest.priceCalculationOfItems();

     expect(result,242);
     

  });

  test('i want to test price calculation for imported material: case when price > 200' , () {
     
     Item importedItemToTest = Item(itemName: 'testitem5' , itemPrice: 10,itemQuantity: 20,itemType: Type.raw);
     
     double result = importedItemToTest.priceCalculationOfItems();

     expect(result,242);
     

  });


 



}