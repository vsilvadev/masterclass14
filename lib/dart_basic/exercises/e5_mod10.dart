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

//5419 8250 0346 1210 - Inválido
//4916 6418 5936 9080 - Válido
void main() {
  print(validateCreditCard(4916641859369080));
  print(validateCreditCard(5419825003461210));
}

bool validateCreditCard(int cardNumber) {
  final List<int> split =
      cardNumber.toString().split('').map(int.parse).toList();

  final lastDigit = split[split.length - 1];
  print('lastDigit $lastDigit');

  //Multiplicar numero por numero
  //COLUNA impar por 1 e par por 2
  //Valor >= 10 separar numero e somar.
  //Final somar todos os valores

  var index = 0;
  final sub = split.sublist(0, 15);
  final multipliedList = sub.map((e) {
    final bool isEven = index % 2 == 0;
    final mult = isEven ? e * 2 : e * 1;
    index++;
    return numberParse(mult);
  }).toList();

  final listSum = multipliedList.reduce((a, b) => a + b);
  print(listSum);

  //3. Com o resultado anterior, faça uma divisão por 10 para obter o resto da divisão:
  final rest = listSum % 10;

  //4. Subtraia o resto da divisão por 10:
  //Se o resto for 0 esse é o dígito
  // Subtrait 10 - resto
  final validationDigit = rest == 0 || rest == 10 ? 0 : 10 - rest;

  /*
  5. Faça a verificação do número que foi separado no item 1 com o resultado
  do item 4. Se os números forem iguais, o cartão é valido, e se forem diferentes, é invalido.
  */
  return validationDigit == lastDigit;
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
