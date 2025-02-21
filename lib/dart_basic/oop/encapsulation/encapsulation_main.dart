import 'package:masterclass/dart_basic/oop/encapsulation/encapsulation.dart';

void main() {
  final vitor = Student('Vitor', lastName: 'Silva');

  print(vitor.getFirstName);

  vitor.setFirstName = 'Vasco';
  print(vitor.getFirstName);

  changeName(vitor);
  print(vitor.getFirstName);

  print(vitor.getFullName());
}

void changeName(Student student) {
  student.setFirstName = 'Lucas';
}
