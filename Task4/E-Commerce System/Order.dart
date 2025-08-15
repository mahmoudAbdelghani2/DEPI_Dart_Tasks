import 'PaymentMethod.dart';
import 'ShoppingCart.dart';

class Order {
  ShoppingCart _cart;
  String _orderID;
  DateTime _createdDate;
  double _totalPrice;

  Order({
    required ShoppingCart cart,
    required String orderID,
    required DateTime createdDate,
  }):_createdDate = createdDate,
     _orderID=orderID,
     _cart =cart,
     _totalPrice = cart.getTotal();

  void set orderID(String orderID) => _orderID = orderID;
  void set createdDate(DateTime createdDate) => _createdDate = createdDate;
  void set totalPrice(double totalPrice) => _totalPrice = totalPrice;

  ShoppingCart get getCart => _cart;
  String get getOrderID => _orderID;
  DateTime get getDateTime => _createdDate;
  double get getTotalPrice => _totalPrice;

  Checkout (PaymentMethod payment){
    payment.pay(this._totalPrice);
  }

}