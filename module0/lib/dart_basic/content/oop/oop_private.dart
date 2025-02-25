void main() {
  final vitor = Student('Vitor', 'Silva');

  print(vitor._firstName);
  print(vitor.lastName);

  vitor._firstName = 'Vasco';
  changeName(vitor._firstName);
  print(vitor._firstName);

  changeName2(vitor);
  print(vitor._firstName);

  print(vitor.getFullName());
}

void changeName(String name) {
  name = 'Lucas';
}

void changeName2(Student student) {
  student._firstName = 'Lucas';
}

class Student {
  String _firstName;
  String lastName;
  Student(
    this._firstName,
    this.lastName,
  );

  String getFullName() {
    return '$_firstName $lastName';
  }
}
