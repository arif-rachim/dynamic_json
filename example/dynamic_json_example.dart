import 'package:dynamic_json/dynamic_json.dart';

main() {
  final person = Dynamic({
    "FirstName": "Arif",
    "LastName": "Rachim",
    "Address": {
      "City": "Dubai",
      "Phone": "050123456",
      "Favorites": ["JavaScript", "ActionScript", "Java", "Dart"]
    }
  });
  print(person.FirstName()); // Arif
  print(person.Address.City()); // Dubai
  print(person.Address
      .Favorites()); // ["JavaScript","ActionScript","Java","Dart"]
  print(person.Address.Favorites[0]()); // JavaScript
}
