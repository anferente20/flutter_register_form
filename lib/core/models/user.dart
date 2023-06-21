import 'package:register_form/core/models/address.dart';

class User {
  String name;
  String lastName;
  DateTime birthDate;
  List<Address> addresses;

  User(
      {required this.addresses,
      required this.birthDate,
      required this.lastName,
      required this.name});
}
