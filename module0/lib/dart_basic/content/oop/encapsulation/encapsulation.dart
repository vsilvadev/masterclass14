class Student {
  String _firstName;
  String get getFirstName => _firstName;
  set setFirstName(String value) => _firstName = value;
  String lastName;

  Student(
    this._firstName, {
    required this.lastName,
  });

  String getFullName() {
    return '$_firstName $lastName';
  }
}
