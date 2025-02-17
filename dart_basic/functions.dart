void main() {
  final resultPositional = fullNamePositional('Vitor', 'Silva');
  print('fullNamePositional: $resultPositional');

  final resultOptional = fullNameOptional('Vitor');
  print('fullNameOptional: $resultOptional');

  final resultOptional2 = fullNameOptional2('Vitor');
  print('fullNameOptional2: $resultOptional2');

  final resultNamedParameters = fullNameNamedParameters(
    lastName: 'Silva',
    name: 'Vitor',
  );
  print('fullNameNamedParameters: $resultNamedParameters');

  final resultPositionalAndNamed = fullNamePositionalAndNamed(
    'Vitor',
    lastName: 'Silva',
  );
  print('fullNamePositionalAndNamed: $resultPositionalAndNamed');

  final resultFunction = fullNamePositional;
  print('fullNamePositional: $resultFunction');
  print('fullNameOptional: ${resultFunction('Vitor', 'Silva')}');
}

//First class function - Can run everywhere
// Positionals Parameters - Will be passed based on the position that are defined
String fullNamePositional(String name, String lastName) {
  final result = '$name $lastName';
  return result;
}

// Optional parameters
String fullNameOptional(String name, [String? lastName]) {
  final result = '$name $lastName';
  return result;
}

// Optional parameters
String fullNameOptional2(String name, [String lastName = '']) {
  final result = '$name $lastName';
  return result;
}

// Named parameters - Will be passed based on the name that are defined
// All the named parameters can be optionals (must give default value or nullable)
// Named parameters can be required
String fullNameNamedParameters(
    {required String name, String? secondName, String lastName = ''}) {
  final result = '$name $lastName';

  return result;
}

//Positional And Named Parameters - Both can be used together
String fullNamePositionalAndNamed(String name, {String lastName = ''}) {
  final result = '$name $lastName';
  return result;
}
