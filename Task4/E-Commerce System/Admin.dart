import 'User.dart';

class Admin extends User {
  List<String> _privileges;

  Admin({
    required super.email,
    required super.password,
    required super.id,
    required List<String> privileges,
  }) : _privileges = privileges;

void set privileges(List<String> privileges) => _privileges = privileges;
List<String> get getPrivileges => _privileges;

}
