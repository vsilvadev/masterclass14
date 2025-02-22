/* 
One of the most useful things we learn in high school is the "Rule of 3".

This is when we have 3 values ​​and we need to know the fourth.

We usually have two groups, and the calculation is done by multiplying the 
values ​​between the two groups in parallel. Example:

--
Group1.1 Group1.2
      X
Group2.1 Group2.2
--
Group1.1 x Group2.2 = Group2.1 x Group1.2

Knowing this, create a function that receives 4 optional arguments and returns 
the resolution of the rule of 3, taking into account that the various argument 
will be considered as the value to be found, so it can only have one necessarily 
"empty" value.
*/

void main() {
  print(ruleOf3(
    v1: 2,
    v2: 4,
    v3: 6,
  ));
}

double ruleOf3({double? v1, double? v2, double? v3, double? v4}) {
  final nonNullableVariables =
      [v1, v2, v3, v4].where((value) => value != null).length;

  double result = 0;
  if (nonNullableVariables == 3) {
    if (v1 == null) {
      result = (v2! * v3!) / v4!;
    } else if (v2 == null) {
      result = (v1 * v4!) / v3!;
    } else if (v3 == null) {
      result = (v1 * v4!) / v2;
    } else if (v4 == null) {
      result = (v2 * v3) / v1;
    }
  }

  return result;
}
