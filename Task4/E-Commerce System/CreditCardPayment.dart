import 'PaymentMethod.dart';

class CreditCardPayment implements PaymentMethod{
  String _cardNumber;
  DateTime _expiryDate;
  String _cvv;
  CreditCardPayment({
    required String cardNumber,
    required DateTime expiryDate,
    required String cvv,
  }):_cardNumber = cardNumber,
  _expiryDate = expiryDate ,
  _cvv = cvv;

  set cardNumber(String cardNumber) => _cardNumber = cardNumber;
  set cvv(String cvv) => _cvv = cvv;
  set expiryDate(DateTime expiryDate) => _expiryDate = expiryDate;
  
  String get getCardNumber => _cardNumber;
  String get getCVV => _cvv;
  DateTime get getExpiryDate => _expiryDate;

@override
void pay(double amount) {
  if (DateTime.now().isBefore(_expiryDate)) {
    print("Payment of $amount EGP completed successfully using Credit Card.");
  } else {
    print("Transaction failed: Card expired.");
  }
}

@override
String paymentDetails() {
  return "Credit Card Number: $_cardNumber, Expiry Date: $_expiryDate";
}
  
}
