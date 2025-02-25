void main() {
  final vitor = Student(firstName: 'Vitor', lastName: 'Silva');

  print(vitor.firstName);
  print(vitor.lastName);

  vitor.firstName = 'Vasco';
  changeName(vitor.firstName);
  print(vitor.firstName);

  changeName2(vitor);
  print(vitor.firstName);

  print(vitor.getFullName());
}

void changeName(String name) {
  name = 'Lucas';
}

void changeName2(Student student) {
  student.firstName = 'Lucas';
}

class Student {
  String firstName;
  String lastName;
  Student({
    required this.firstName,
    required this.lastName,
  });

  String getFullName() {
    return '$firstName $lastName';
  }
}
