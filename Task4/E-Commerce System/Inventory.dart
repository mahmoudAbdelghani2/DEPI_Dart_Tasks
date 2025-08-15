import 'Product.dart';

class Inventory {
  List<Map<Product, int>> _stock;

  Inventory({required List<Map<Product, int>> stock}) : _stock = stock;

  void set stock(List<Map<Product, int>> stock) => _stock = stock;
  List<Map<Product, int>> get getStock => _stock;

  void addProduct(Product product, int quantity) {
    if (quantity < 0) {
      quantity = 0;
    }
    for (var item in _stock) {
      if (item.containsKey(product)) {
        print("Product already exists in stock!");
        return;
      }
    }
    _stock.add({product: quantity});
    print("Product added successfully.");
  }

  bool checkAvailability(Product product) {
    for (var item in _stock) {
      if (item.containsKey(product)) {
        print("Product is available in stock.");
        return true;
      }
    }
    print("Product is not available in stock.");
    return false;
  }

  void updateStock(Product product, int quantity) {
    for (var item in _stock) {
      if (item.containsKey(product)) {
        int newQuantity = item[product]! + quantity;
        if (newQuantity < 0) {
          newQuantity = 0;
        }
        item[product] = newQuantity;
        print("Stock updated successfully. New quantity is: $newQuantity");
        return;
      }
    }
    print("Product is not on the stock, we will add it.");
    addProduct(product, quantity < 0 ? 0 : quantity);
  }
}
