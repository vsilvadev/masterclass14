/*
Vigenère cipher is a simple encryption method used to scramble text.
Values ​​other than letters ARE NOT TRANSFORMED.

Create a class that executes 3 business rules related to encryption:
A - Random Key Generator.
B - Encode (Return the encrypted text)
C - Decode (Return the decrypted text).

Note: Use only uppercase values. Make sure of that!

A. Key Algorithm:
To perform the encode and decode, it is necessary to have a 
key that has random values but that has the same number
of characters as the text to be encrypted.


B. Encode:
Step 1: Receive the text to be encrypted and the key in question.
Step 2: Add the charCode of each letter of the text and the key in their respective
positions and divide by 26. The REST of this division must be added to the CharCode of the letter A.
Step 3: The result of the previous addition is the new char.

Remember: Non-alphabet values ​​should not be transformed.

C. Decode:
Step 1: Receive the encrypted text and the key.
Step 2: Subtract the charCode of each letter of the text and the key in 
their respective positions, adding the result to 26. The result must be divided by 26.
The REST of this division must be added to the CharCode of the letter A.
Step 3: The result of the previous addition is the decrypted char.
*/

import 'dart:math';

void main() {
  final text = 'Bom Dia';
  final encryption = ViginerEncryption(text: text);
  print(encryption.encode(text: text, key: 'QMH FPL'));
  print(encryption.decode(criptText: 'RAT IXL', key: 'QMH FPL'));
}

abstract class Encryption {
  String generateKey();
  String encode({required String text, required String key});
  String decode({required String criptText, required String key});
}

class ViginerEncryption implements Encryption {
  final String text;

  ViginerEncryption({required this.text});

  @override
  String generateKey() {
    final upperText = text.toUpperCase();
    final Random random = Random();

    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Set<String> charSet = chars.split('').toSet();

    final key = upperText.split('').map((char) {
      if (charSet.contains(char)) {
        return chars[random.nextInt(chars.length)];
      } else {
        return char;
      }
    }).join();

    return key;
  }

  @override
  String encode({required String text, required String key}) {
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

  @override
  String decode({required String criptText, required String key}) {
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

    return encoded;
  }
}
