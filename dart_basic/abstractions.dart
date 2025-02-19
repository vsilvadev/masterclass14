/*
Class: Something that gives the ability to create types
Concrete class: Class with methods that need to be implemented
Abstract class: Class with methods that can be only Contracts
*/
void main() {
  //Can create an A type and assign it to a variable
  A a = A();
  //B class can be assigned to an A type variable because of inheritance. Will print 'b'
  // A a = B();

  a.printName();

  //This variable will have the A type because of inheritance and B type because of the instance.
  B b = B();
  print(b is A); //true
  print(b is B); //true

  //The A class WILL NOT have the same type as the child B class
  print(a is A); //true
  print(a is B); //false

  /* 
  DEPENDENCY INVERSION:
  When we have an type parameter and we use a different instance.
  Can use the father A instance or use dependency inversion with the B child instance.

  If it's needed to pass a parameter with the type A class, it's possible to pass the
  A instance or the B instance because of inheritance
  */
  void execPrint(A a) {
    a.printName();
  }

  execPrint(A());
  execPrint(B());

  //If I need to pass a parameter from type B, it's possible to pass ONLY the B instance.
  void execPrint2(B b) {
    b.printName();
  }

  // execPrint2(A()); -> Will not work
  execPrint2(B());

  //With both classes implementing the same abstract class it's possible
  //to pass both instances doing control inversion.
  A2 a2 = A2();
  B2 b2 = B2();
  execPrint3(a2);
  execPrint3(b2);
}

void execPrint3(IPrint i) {
  i.printName();
}

/*
POLYMORPHISM: 
Child classes can invoke the father methods with the
same signature but different behaviour.
*/
//A Class (Father)
class A {
  void printName() {
    print('A');
  }
}

/*
Class B (child) will have all that A has (inheritence)
When B extends A he will be equal to A.
*/
class B extends A {
  void printName() {
    print('B');
  }
}

//---------------------------------------------------------------------------------

/*
ABSTRACT CLASS:
- Can't be instantiated.
- Can be used as a commom Type for different classes allowing
control inversion.
- Can have properties and methods in the signature format.
*/
abstract class IPrint {
  //CONTRACT:
  //If the method doens't have a body, all the child classes must implement this.
  void printName();

  //When the method has an implementation, child implementation is optional.
  void printColor() {
    print('Blue');
  }
}

/*
EXTENDS:
- Inherit from concrete or abstract class
- Child classes must implement only CONTRACT methods
- Can reuse the concrete methods from the father class

IMPLEMENTS:
- Child classes must implement all the methods. (even the concrete ones)
*/
class A2 implements IPrint {
  //Implementing all classes from IPrint
  @override
  void printName() {
    print('A2');
  }

  @override
  void printColor() {
    print('Red');
  }
}

class B2 extends IPrint {
  //Implementing only the printName CONTRACT method
  @override
  void printName() {
    print('B2');
  }
}
