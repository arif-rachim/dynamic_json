Access JSON attributes with dot operator.

Dynamic is a function that accepts JSON (Map), and returns a DynamicObject. 
With DynamicObject, we can take values ​​from JSON using dot operators instead 
of using brackets. We can also chain dot operators to retrieve nested values ​​from the 
Object too. When we perform chain calls, the last call must be closed with parentheses 
(as if calling a function) to get the actual value.

marsa.emreef@gmail.com 2019

[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

```dart
import 'package:dynamic_json/dynamic_json.dart';

main() {
    final person = Dynamic({ "FirstName" : "Marsa" , "LastName" : "Emreef" , "Address" :{ "City" : "Dubai" , "Phone" : "050123456"  , "Favorites" : ["JavaScript","ActionScript","Java","Dart"]}});
    print(person.FirstName()); // Marsa
    print(person.Address.City()); // Dubai
    print(person.Address.Favorites()); // ["JavaScript","ActionScript","Java","Dart"]
    print(person.Address.Favorites[0]()); // JavaScript

}
```

