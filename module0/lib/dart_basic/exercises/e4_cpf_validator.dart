/*
The CPF has two verification digits, which are the last two numbers of the CPF.

- Calculation of the first verification digit:

1. The first step is to calculate the first verification digit, and to do this, we separate the first
9 digits of the CPF (111,444,777) and multiply each of the numbers, from right to left,
by increasing numbers starting from the number 2.
2. Multiply each digit of the CPF by the respective number and add each of the results.
3. Divide the value obtained by 11. We will work with the REST and not with the VALUE of the division.
4. If the remainder of the division is less than 2, then the digit is equal to 0 (zero).

If the remainder of the division is greater than or equal to 2, then the verification digit is
equal to 11 minus the remainder of the division (11 - remainder).
The result must be equal to the first verification digit.

- Calculation of the second verification digit:
1. We will take the first 10 digits of the CPF (111.444.777-1) and multiply each of the numbers, from right to left, by increasing numbers starting from number 2.
2. With the result in hand, follow steps 2, 3 and 4 of the calculation of the first digit.

The result must be equal to the second verification digit.
*/

void main() {
  final Person person = Person(cpf: '252.217.810-50');
  final Person person2 = Person(cpf: '111.111.111-11');

  print(person.validateCpf());
  print(person2.validateCpf());
}

class Person {
  String cpf;

  Person({required this.cpf});

  bool validateCpf() {
    List<int> digitsList = cpfParse();
    final isCpfNumberValid = cpfNumberIsValid(digitsList);

    if (isCpfNumberValid) {
      final validationDigit1 = findValidationDigit(digitsList.sublist(0, 9));
      final d1Validation =
          validationDigit1 == digitsList[digitsList.length - 2];

      final validationDigit2 =
          findValidationDigit([...digitsList.sublist(0, 9), validationDigit1]);
      final d2Validation =
          validationDigit2 == digitsList[digitsList.length - 1];

      return d1Validation == true && d2Validation == true;
    } else {
      return false;
    }
  }

  List<int> cpfParse() {
    return cpf
        .split('')
        .where((char) => '0123456789'.contains(char))
        .map(int.parse)
        .toList();
  }

  bool cpfNumberIsValid(List<int> cpfList) {
    final cpfListSet = cpfList.toSet();
    return cpfList.length == 11 && cpfListSet.length != 1;
  }

  int findValidationDigit(List<int> digitsList) {
    var multiplyer = 2;
    final multipliedList = digitsList.reversed
        .toList()
        .map((number) {
          final result = multiplyer * number;
          multiplyer = multiplyer + 1;
          return result;
        })
        .toList()
        .reversed
        .toList();

    final listSumDivideBy11 = multipliedList.reduce((a, b) => a + b) % 11;
    return listSumDivideBy11 < 2 ? 0 : 11 - listSumDivideBy11;
  }
}
