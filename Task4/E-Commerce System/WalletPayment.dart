import 'PaymentMethod.dart';

class WalletPayment implements PaymentMethod{
  String _phoneNumber;

  WalletPayment({required String phoneNumber}):_phoneNumber = phoneNumber;

  set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;
  String get getPhoneNumber => _phoneNumber;

@override
void pay(double amount) { // +201001373691
  String phoneStart = _phoneNumber.substring(0, 5);
  List<String> validPrefixes = ["+2010", "+2011", "+2012", "+2015"];
  if (validPrefixes.contains(phoneStart) && _phoneNumber.length == 13) {
    print("Payment of $amount EGP completed successfully using Wallet.");
  } else {
    print("Transaction failed: Invalid Egyptian phone number.");
  }
}


@override
String paymentDetails() {
  return "Wallet Phone Number: $_phoneNumber";
}

  
}
