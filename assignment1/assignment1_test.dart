import 'package:test/test.dart';
import 'class.dart';

void main() {
  group("price calculation of Raw Item"){
  test('test to check price calculation of Raw Material', () {
    Item rawItemtoTest = Item(
        itemName: 'testitem1',
        itemPrice: 10,
        itemQuantity: 5,
        itemType: ItemType.raw);

    double result = rawItemtoTest.priceCalculationOfItems();

    expect(result, 56.25);
    except(result, isNot(56));
  });

  test(
      ' test to check price calculation for imported material: case when price < 100',
      () {
    Item importedItemToTest = Item(
        itemName: 'testitem2',
        itemPrice: 10,
        itemQuantity: 5,
        itemType: ItemType.raw);

    double result = importedItemToTest.priceCalculationOfItems();

    expect(result, 60);
  });
  }

  test(
      'test of price calculation for imported material: case when price > 100 && price <= 200',
      () {
    Item importedItemToTest = Item(
        itemName: 'testitem3',
        itemPrice: 10,
        itemQuantity: 10,
        itemType: ItemType.raw);

    double result = importedItemToTest.priceCalculationOfItems();

    expect(result, 120);
  });

  test(
      'test of price calculation for imported material: case when price > 200',
      () {
    Item importedItemToTest = Item(
        itemName: 'testitem4',
        itemPrice: 10,
        itemQuantity: 20,
        itemType: ItemType.raw);

    double result = importedItemToTest.priceCalculationOfItems();

    expect(result, 242);
  });

  test(
      'test of price calculation for imported material: case when price > 200',
      () {
    Item importedItemToTest = Item(
        itemName: 'testitem5',
        itemPrice: 10,
        itemQuantity: 20,
        itemType: ItemType.raw);

    double result = importedItemToTest.priceCalculationOfItems();

    expect(result, 242);
  });

  test(
      'test of object instansiation of imported item',
      () {
    Item importedItemToTest = Item(
        itemName: 'testitem5',
        itemPrice: 10,
        itemQuantity: 20,
        itemType: ItemType.raw);

    String result = importedItemToTest.itemName;

    expect(result, 'testitem5');
  });

  test(
      'test of object instansiation of manufactured item',
      () {
    Item manufacturedItemToTest = Item(
        itemName: 'testitem6',
        itemPrice: 10,
        itemQuantity: 20,
        itemType: ItemType.manufactured);

    String result = manufacturedItemToTest.itemName;

    expect(result, 'testitem6');
  });

   test(
      'test of add new item function',
      () {

   String result  = Util.addMoreItem('x')

    expect(result, 'Invalid choice by the User');
  });




}
