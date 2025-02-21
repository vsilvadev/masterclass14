main() {
  //List structure
  final list = ['Car', 'Truck'];

  //Add element to list
  list.add('Bike');

  //Add element to the list in any place
  list.insert(0, 'Bus');

  print('list: ${list}');

  //Set structure: similar to list but with unique elements
  final set = {'Car', 'Truck', 'Car'};
  set.add('Bike');
  print('set: ${set}');

  //Map structure: key-value pair
  final map = {
    'Car': 'Toyota',
    'Truck': 'Ford',
    'Bike': 'Honda',
  };

  print('map: ${map}');

  //Show a value in the map
  print('Car value: ${map['Car']}');
}
