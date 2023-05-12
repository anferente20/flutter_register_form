class User {
  String name;
  String lastName;
  DateTime birthDate;
  Map<String, dynamic> addresses;

  User(
      {required this.addresses,
      required this.birthDate,
      required this.lastName,
      required this.name});
}
