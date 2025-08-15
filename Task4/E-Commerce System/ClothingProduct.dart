import 'Product.dart';

class Clothingproduct extends Product {
  String _availableSize;
    Clothingproduct({
    required super.name,
    required super.id,
    required super.price,
    required super.description,
    required String availableSize,
    }
  ): _availableSize = availableSize;
  void set availableSize(String availableSize) =>
      _availableSize = availableSize;

  String get getAvailableSize => _availableSize;

  @override
  String displayDetails() 
  => "Product Name is $getName, Product ID is $getID, Product Price is $getPrice, Product Description is $getDescription and Product Available Size is $getAvailableSize.";
}
