import 'package:masterclass/dart_basic/oop/abstract/abstract_main.dart';

class Student {
  String _firstName;
  String get getFirstName => _firstName;
  set setFirstName(String value) => _firstName = value;
  String lastName;

  Student(
    this._firstName, {
    required this.lastName,
  });

  String getFullName(MergeTextService mergeTextService) {
    return mergeTextService.mergeText(_firstName, lastName);
  }
}
