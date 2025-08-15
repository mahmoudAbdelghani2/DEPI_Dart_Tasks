import 'User.dart';

class Customer extends User {
  String _shippingAddress;

  Customer({
    required super.email,
    required super.password,
    required super.id,
    required String shippingAddress,
  }) : _shippingAddress = shippingAddress;

  void set shippingAddress(String shippingAddress) =>
      _shippingAddress = shippingAddress;

  String get getShippingAddress => _shippingAddress;
}
