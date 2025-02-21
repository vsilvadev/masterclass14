import 'package:masterclass/dart_basic/content/oop/inheritance/inheritance.dart';

void main() {
  final vitor = Student('Vitor', lastName: 'Silva');

  print(vitor.getFullName(MergeTextService()));
  print(vitor.getFullName(UpperMergeTextService()));

  final service = MergeTextService();

  print(service is MergeTextService);
  print(service is UpperMergeTextService);

  final serviceChild = UpperMergeTextService();
  print(serviceChild is MergeTextService);
  print(serviceChild is UpperMergeTextService);
}

class MergeTextService {
  String mergeText(String text1, String text2) {
    return '$text1 $text2';
  }
}

class UpperMergeTextService extends MergeTextService {
  @override
  String mergeText(String text1, String text2) {
    return super.mergeText(text1, text2).toUpperCase();
  }
}
