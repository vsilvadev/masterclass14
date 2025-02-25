import 'abstract.dart';

void main() {
  final vitor = Student('Vitor', lastName: 'Silva');

  print(vitor.getFullName(UpperMergeTextService()));
  print(vitor.getFullName(LowerMergeTextService()));
}

abstract class MergeTextService {
  String mergeText(String text1, String text2);
}

class UpperMergeTextService extends MergeTextService {
  @override
  String mergeText(String text1, String text2) {
    return '$text1 $text2'.toUpperCase();
  }
}

class LowerMergeTextService extends MergeTextService {
  @override
  String mergeText(String text1, String text2) {
    return '$text1 $text2'.toLowerCase();
  }
}
