/*
BMI Calculation 

The body mass index (BMI) is based on the individual's height and weight.
The calculation is represented by dividing the weight by the height squared².
Create a function that performs the BMI calculation.
*/

void main() {
  final person = Person(weight: 100, height: 1.80);
  print(person.calculateBMI());
}

class Person {
  final double weight;
  final double height;

  Person({required this.weight, required this.height});

  double calculateBMI() {
    final cmHeight = height > 2.52 ? height / 100 : height;
    return double.parse((weight / (cmHeight * cmHeight)).toStringAsFixed(1));
    //pow(cmHeight, 2) could have been used to calculate a numer power
  }
}
