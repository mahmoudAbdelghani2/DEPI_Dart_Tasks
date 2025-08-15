import 'Admin.dart';
import 'Customer.dart';
import 'ElectronicProduct.dart';
import 'ClothingProduct.dart';
import 'Inventory.dart';
import 'ShoppingCart.dart';
import 'Order.dart';
import 'WalletPayment.dart';
import 'CreditCardPayment.dart';

void main() {
  print("============ E-Commerce System Log ============\n");

  Admin admin = Admin(
      email: "mahmoud@gmail.com",
      password: "mahmoud123",
      id: 1,
      privileges: ["Add Product", "Update Stock"]);
  print("Admin Created: ${admin.getEmail} with privileges: ${admin.getPrivileges}\n");

  Customer customer = Customer(
      email: "ibrahim@gmail.com",
      password: "ibrahim123",
      id: 2,
      shippingAddress: "Giza, Egypt");
  print("Customer Created: ${customer.getEmail}, Address: ${customer.getShippingAddress}\n");


  Electronicproduct laptop = Electronicproduct(
      name: "HP Laptop",
      id: 101,
      price: 25000,
      description: "It's just a laptop !",
      warrantyPeriod: "25 years");

  Clothingproduct tshirt = Clothingproduct(
      name: "T-shirt",
      id: 202,
      price: 350,
      description: "It's just a T-shirt !",
      availableSize: "L");

  print("Products Created:\n${laptop.displayDetails()}\n${tshirt.displayDetails()}\n");

  
  Inventory inventory = Inventory(stock: []);
  inventory.addProduct(laptop, 5);
  inventory.addProduct(tshirt, 20);
  print("");

  
  ShoppingCart cart = ShoppingCart(items: [], customer: customer);
  if (inventory.checkAvailability(laptop)) {
    cart.addItem(laptop, 2);
  }
  if (inventory.checkAvailability(tshirt)) {
    cart.addItem(tshirt, 3);
  }
  print("");

  
  Order order = Order(
      cart: cart, orderID: "0001", createdDate: DateTime.now());
  print("Order Created: ${order.getOrderID}, Date: ${order.getDateTime}, Total: ${order.getTotalPrice} EGP\n");

  
  CreditCardPayment creditCard = CreditCardPayment(
      cardNumber: "1234-5678-9876-5432",
      expiryDate: DateTime(2026, 5, 30),
      cvv: "123");
  print("Payment Method Created: ${creditCard.paymentDetails()}\n");

  
  order.Checkout(creditCard);
  print("");

  
  WalletPayment wallet = WalletPayment(phoneNumber: "+201001373691");
  print("Payment Method Created: ${wallet.paymentDetails()}");
  order.Checkout(wallet);

  print("\n============ End of Log ============");
}
