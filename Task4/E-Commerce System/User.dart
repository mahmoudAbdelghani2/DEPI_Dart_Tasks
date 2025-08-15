class User {
  String _email;
  String _password;
  int _id;
  User({
    required String email,
    required String password,
    required int id
    }
  ):_email = email,
    _password = password,
    _id = id;

  void set email(String email) => _email = email;
  String get getEmail => _email;

  void set password(String password) => _password = password;
  String get getPassword => _password;

  void set ID(int ID) => _id = ID;
  int get getID => _id;
}
