abstract class Product {
  String _name;
  int _price;
  String _description;
  int _id;

  Product({
    required String name,
    required int id,
    required int price,
    required String description,
  }):_description = description,
     _id = id,
     _name = name,
     _price = price;
  void set name(String name)=> _name = name;
  void set price(int price)=> _price = price;
  void set description(String description)=> _description = description;
  void set id(int id)=> _id = id;

  String get getName => _name;
  String get getDescription => _description;
  int get getID => _id;
  int get getPrice => _price;

  String displayDetails();
}