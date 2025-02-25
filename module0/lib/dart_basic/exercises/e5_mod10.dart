/*
1. Separe o último dígito do cartão. Neste caso é o zero.

2. Multiplique a numeração do cartão, número por número,
sendo a coluna ímpar por 1 e a coluna par por 2, levando em conta que a
primeira coluna inicia-se por 0 (zero). Se o valor da multiplicação
tiver dois dígitos, separe e some cada unidade. Em seguida, some todos os valores.

3. Com o resultado anterior, faça uma divisão por 10 para obter o resto da divisão:

4. Subtraia o resto da divisão por 10:

5. Faça a verificação do número que foi separado no item 1 com o resultado
do item 4. Se os números forem iguais, o cartão é valido, e se forem diferentes, é invalido.

*/

void main() {
  //Valid
  final CreditCard card = CreditCard(creditCardNumber: '4916641859369080');
  final CreditCard card2 = CreditCard(creditCardNumber: '491.664185-936,90.80');

  //Invalid
  final CreditCard card3 = CreditCard(creditCardNumber: '5419825003461210');
  final CreditCard card4 = CreditCard(creditCardNumber: '541.982.500.346.1210');
  final CreditCard card5 = CreditCard(creditCardNumber: '49122226641859369080');

  print(card.validateCreditCard());
  print(card2.validateCreditCard());
  print(card3.validateCreditCard());
  print(card4.validateCreditCard());
  print(card5.validateCreditCard());
}

class CreditCard {
  final String creditCardNumber;

  CreditCard({required this.creditCardNumber});

  bool validateCreditCard() {
    final List<int> digitsList = creditCardNumberParse();
    final isCreditCardNumberValid = creditCardNumberIsValid(digitsList);
    if (isCreditCardNumberValid) {
      final lastDigit = digitsList[digitsList.length - 1];

      var index = 0;
      final digitsWithoutLast = digitsList.sublist(0, 15);
      final multipliedList = digitsWithoutLast.map((e) {
        final bool isEven = index % 2 == 0;
        final mult = isEven ? e * 2 : e * 1;
        index++;
        return numberParse(mult);
      }).toList();

      final listSum = multipliedList.reduce((a, b) => a + b);
      final rest = listSum % 10;
      final validationDigit = rest == 0 || rest == 10 ? 0 : 10 - rest;

      return validationDigit == lastDigit;
    } else {
      return false;
    }
  }

  List<int> creditCardNumberParse() {
    return creditCardNumber
        .split('')
        .where((char) => '0123456789'.contains(char))
        .map(int.parse)
        .toList();
  }

  bool creditCardNumberIsValid(List<int> cpfList) {
    return cpfList.length == 16;
  }

  int numberParse(value) {
    if (value >= 10) {
      final aux = value.toString().split('').map(int.parse).toList();
      final auxSum = aux[0] + aux[1];
      return auxSum >= 10 ? numberParse(auxSum) : auxSum;
    } else {
      return value;
    }
  }
}
