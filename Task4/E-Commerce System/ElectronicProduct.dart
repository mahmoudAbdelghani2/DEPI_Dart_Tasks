import 'Product.dart';

class Electronicproduct extends Product {
  String _warrantyPeriod;
    Electronicproduct({
    required super.name,
    required super.id,
    required super.price,
    required super.description,
    required String warrantyPeriod,
    }
  ): _warrantyPeriod = warrantyPeriod;
  void set warrantyPeriod(String warrantyPeriod) =>
      _warrantyPeriod = warrantyPeriod;

  String get getWarrantyPeriod => _warrantyPeriod;

  @override
  String displayDetails()
    => "Product Name is $getName, Product ID is $getID, Product Price is $getPrice, Product Description is $getDescription and Product Warranty Period is $getWarrantyPeriod.";
}

