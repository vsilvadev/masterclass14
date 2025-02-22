/*
Cifra de Vigenère é uma criptografia simples usada para embaralhar textos.
Valores que não seja letras NÃO SÃO TRANSFORMADOS.

Crie uma classe que execute 3 regras de negócio relacionado a criptografia:

A - Gerador de Key randômica.
B - Encode (Retorne o texto criptografado)
C - Decode (Retorne o texto descriptografado).

Obs: Use apenas valores maiúsculos. Certifique-se disso! 

```
A. Algorítimo para Key:

Para executar o encode e decode é necessário ter uma chave que tenha valores randômicos
mas que tenha a mesma quantidade de caracteres do texto a ser criptografado.


B. Encode:

Passo 1: Receba a o texto a ser criptografado e a chave em questão.
Passo 2: deve-se somar o charCode de cada letra do texto e da key em suas respectivas
posições e dividir por 26. O RESTO dessa divisão deve ser somado com o CharCode da letra A.
Passo 3: O resultado da soma anterior é o novo char.
Lembre-se: Valores não alfabetos não devem ser transformados.

C. Decode:

Passo 1: Receba a o texto criptografado e a chave.
Passo 2: deve-se subtrair o charCode de cada letra do texto e da key em suas
respectivas posições somando o resultado com 26. O resultado deve ser dividido por 26.
O RESTO dessa divisão deve ser somado com o CharCode da letra A.
Passo 3: O resultado da soma anterior é o char descriptografado.
*/

import 'dart:math';

void main() {
  final text = 'Bom Dia';
  final cripto = Cripto(text: text);
  // print(cripto.generateKey());
  print(cripto.encode(text: text, key: 'QMH FPL'));
  print(cripto.decode(criptText: 'RAT IXL', key: 'QMH FPL'));
}

class Cripto {
  final String text;

  Cripto({required this.text});

  String generateKey() {
    //Letra maíscula em tudo
    final upperText = text.toUpperCase();
    final Random random = Random();

    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Set<String> charSet = chars.split('').toSet();

    //Se a letra existir no Set eu gero o random
    final key = upperText.split('').map((char) {
      if (charSet.contains(char)) {
        return chars[random.nextInt(chars.length)];
      } else {
        return char;
      }
    }).join();

    return key;
  }

  String encode({required String text, required String key}) {
    /*
    
    Passo 1: Receba a o texto a ser criptografado e a chave em questão.

    Passo 2: deve-se somar o charCode de cada letra do texto e da key
    em suas respectivas posições e dividir por 26. O RESTO dessa divisão deve
    ser somado com o CharCode da letra A.
    
    Passo 3: O resultado da soma anterior é o novo char.
    */
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Set<String> charSet = chars.split('').toSet();

    final textUpper = text.toUpperCase();

    var counter = 0;
    final encoded = textUpper.split('').map((char) {
      if (charSet.contains(char)) {
        final charT = textUpper[counter];
        final charK = key[counter];

        final charTCode = charT.codeUnitAt(0);
        final charKCode = charK.codeUnitAt(0);

        final charsSumRest26 = (charTCode + charKCode) % 26;
        final finalChar = charsSumRest26 + "A".codeUnitAt(0);

        counter++;
        return String.fromCharCode(finalChar);
      } else {
        counter++;
        return char;
      }
    }).join();

    return encoded;
  }

  String decode({required String criptText, required String key}) {
    /*
    Passo 1: Receba a o texto criptografado e a chave.
    
    Passo 2: deve-se subtrair o charCode de cada letra do texto e 
    da key em suas respectivas posições somando o resultado com 26. 
    O resultado deve ser dividido por 26. O RESTO dessa divisão deve ser 
    somado com o CharCode da letra A.
 
  */
    var counter = 0;
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Set<String> charSet = chars.split('').toSet();

    final criptTextUpper = criptText.toUpperCase();
    final encoded = criptTextUpper.split('').map((char) {
      if (charSet.contains(char)) {
        final charT = criptTextUpper[counter];
        final charK = key[counter];

        final charTCode = charT.codeUnitAt(0);
        final charKCode = charK.codeUnitAt(0);

        final charsSum = (charTCode - charKCode) + 26;
        final sumRest26 = charsSum % 26;
        final finalChar = sumRest26 + "A".codeUnitAt(0);

        counter++;
        return String.fromCharCode(finalChar);
      } else {
        counter++;
        return char;
      }
    }).join();
    /*

    Passo 3: O resultado da soma anterior é o char descriptografado.
    */
    return encoded;
  }
}
