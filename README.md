# Access JSON attributes with dot operator.

Dynamic is a function that accepts JSON (Map), and returns a DynamicObject. 
With DynamicObject, we can take values ​​from JSON using dot operators instead 
of using brackets. We can also chain dot operators to retrieve nested values ​​from the 
Object too. When we perform chain calls, the last call must be closed with parentheses 
(as if calling a function) to get the actual value.

[license](https://github.com/marsa-emreef/dynamic_json/blob/master/LICENSE.md).

## Usage

A simple usage example:

```dart
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
  print(person.Address.Favorites()); // ["JavaScript","ActionScript","Java","Dart"]
  print(person.Address.Favorites[0]()); // JavaScript
}

```
