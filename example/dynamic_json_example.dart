import 'package:dynamic_json/dynamic_json.dart';

main() {
  final person = Dynamic({
    "FirstName": "John",
    "LastName": "Doe",
    "Address": {
      "City": "Dubai",
      "Phone": "050123456",
      "Favorites": ["JavaScript", "ActionScript", "Java", "Dart"]
    }
  });
  print(person.FirstName()); // John
  print(person.Address.City()); // Dubai
  print(person.Address
      .Favorites()); // ["JavaScript","ActionScript","Java","Dart"]
  print(person.Address.Favorites[0]()); // JavaScript
}
