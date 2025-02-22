/*
BMI Calculation 

The body mass index (BMI) is based on the individual's height and weight.
The calculation is represented by dividing the weight by the height squared².
Create a function that performs the BMI calculation.
*/

void main() {
  final bmi = calculateBMI(100, 1.80);
  print(bmi);
}

double calculateBMI(double weight, double height) {
  final cmHeight = height > 2.52 ? height / 100 : height;
  return double.parse((weight / (cmHeight * cmHeight)).toStringAsFixed(1));
  //pow(cmHeight, 2) could have been used to calculate the power
}
