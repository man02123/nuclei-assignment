enum Type { raw, manufactured, imported }

abstract class Item {
  static List<dynamic> currentItems = [];

  double priceCalculation();

  factory Item(
      Type itemType, String itemName, int itemPrice, int itemQuantity) {
    switch (itemType) {
      case Type.imported:
        return importedItem(
            itemName: itemName,
            itemPrice: itemPrice,
            itemQuantity: itemQuantity);

      case Type.manufactured:
        return manufacturedItem(
            itemName: itemName,
            itemPrice: itemPrice,
            itemQuantity: itemQuantity);
      case Type.raw:
        return rawItem(
            itemName: itemName,
            itemPrice: itemPrice,
            itemQuantity: itemQuantity);
      default:
        return rawItem(
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
  double priceCalculation() {
    double imported =
        (0.10 * itemPrice) * itemQuantity + itemPrice * itemQuantity;

    if (imported <= 100) {
      imported += 5;
    } else if (imported > 100 && imported <= 200) {
      imported += 10;
    } else if (imported > 200) {
      imported = (0.10 * imported) + imported;
    }

    return imported;
  }
}

class manufacturedItem implements Item {
  int itemPrice;
  String itemName;
  int itemQuantity;
  manufacturedItem(
      {required this.itemName,
      required this.itemPrice,
      required this.itemQuantity});
  @override
  double priceCalculation() {
    double p1 = (0.125 * itemPrice) * itemQuantity;
    return (0.02 * p1) + p1 + itemPrice * itemQuantity;
  }
}

class rawItem implements Item {
  int itemPrice;
  String itemName;
  int itemQuantity;

  @override
  double priceCalculation() {
    return (0.125 * itemPrice) * itemQuantity + itemPrice * itemQuantity;
  }

  rawItem(
      {required this.itemName,
      required this.itemPrice,
      required this.itemQuantity});
}
