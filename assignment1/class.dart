enum ItemType { raw, manufactured, imported }

abstract class Item {
  static List<dynamic> currentItems = [];

  double calculateItemPrice();

  factory Item(
      ItemType itemType, String itemName, int itemPrice, int itemQuantity) {
    switch (itemType) {
      case ItemType.imported:
        return importedItem(
            itemName: itemName,
            itemPrice: itemPrice,
            itemQuantity: itemQuantity);

      case ItemType.manufactured:
        return ManufacturedItem(
            itemName: itemName,
            itemPrice: itemPrice,
            itemQuantity: itemQuantity);
      case ItemType.raw:
        return RawItem(
            itemName: itemName,
            itemPrice: itemPrice,
            itemQuantity: itemQuantity);
      default:
        return RawItem(
            itemName: itemName,
            itemPrice: itemPrice,
            itemQuantity: itemQuantity);
    }
  }
}

class importedItem implements Item {
  int itemPrice;
  String itemName;
  int itemQuantity;
  importedItem(
      {required this.itemName,
      required this.itemPrice,
      required this.itemQuantity});

  @override
  double calculateItemPrice() {
    double priceOfImportedItem =
        (0.10 * itemPrice) * itemQuantity + itemPrice * itemQuantity;

    if (priceOfImportedItem <= 100) {
      priceOfImportedItem += 5;
    } else if (priceOfImportedItem > 100 && priceOfImportedItem <= 200) {
      priceOfImportedItem += 10;
    } else if (priceOfImportedItem > 200) {
      priceOfImportedItem = (0.10 * priceOfImportedItem) + priceOfImportedItem;
    }

    return priceOfImportedItem;
  }
}

class ManufacturedItem implements Item {
  int itemPrice;
  String itemName;
  int itemQuantity;
  ManufacturedItem(
      {required this.itemName,
      required this.itemPrice,
      required this.itemQuantity});
  @override
  double calculateItemPrice() {
    double priceOfManufacturedItem = (0.125 * itemPrice) * itemQuantity;
    return (0.02 * priceOfManufacturedItem) +
        priceOfManufacturedItem +
        itemPrice * itemQuantity;
  }
}

class RawItem implements Item {
  int itemPrice;
  String itemName;
  int itemQuantity;
  RawItem(
      {required this.itemName,
      required this.itemPrice,
      required this.itemQuantity});

  @override
  double calculateItemPrice() {
    return (0.125 * itemPrice) * itemQuantity + itemPrice * itemQuantity;
  }

  @override
  String toString() {
    return 'Name: $itemName , ItemPrice : $itemPrice';
  }
}
