import 'Customer.dart';
import 'Product.dart';

class ShoppingCart {
  
  Customer _customer;
  List<Map<Product, int>> _items;

  ShoppingCart({
    required List<Map<Product, int>> items,
    required Customer customer
    }):_items = items, _customer = customer;

  void set items(List<Map<Product, int>> items) => _items = items;
  List<Map<Product, int>> get getItems => _items;

  Customer get getCustomer => _customer;

  void addItem(Product product, int quantity){
    if (quantity < 0) {
      quantity = 0;
    }
    for (var item in _items) {
      if (item.containsKey(product)) {
        int newQuantity = item[product]! + quantity;
        if (newQuantity < 0) {
          newQuantity = 0;
          item.remove(product);
          print("item Deleted successfully because New quantity is 0");
          return;
        }
        item[product] = newQuantity;
        print("item updated successfully. New quantity is: $newQuantity");
        return;
      }
    }
    _items.add({product: quantity});
    print("Product added successfully.");
  } 

  void removeItem(Product product){
    for (var item in _items) {
      if (item.containsKey(product)) {
        item.remove(product);
        print("Product removed successfully.");
        return;
      }
    }
    print("Product is not available in items.");
  }
  
  double getTotal() {
  double total = 0;
  for (var item in _items) {
    item.forEach((product, quantity) {
      total += product.getPrice * quantity;
    });
  }
  print("Total price of items in cart is: $total");
  return total;
}
}
