import 'package:dynamic_json/dynamic_json.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    var person;

    setUp(() {
      person = Dynamic({
        "FirstName": "John",
        "LastName": "Doe",
        "Address": {
          "City": "Dubai",
          "Phone": "050123456",
          "Favorites": ["JavaScript", "ActionScript", "Java", "Dart"]
        }
      });
    });

    test('Accessing One Level', () {
      expect('John', person.FirstName());
    });

    test('Accessing Two Level', () {
      expect('Dubai', person.Address.City());
    });

    test('Accessing Array', () {
      expect(["JavaScript", "ActionScript", "Java", "Dart"],
          person.Address.Favorites());
    });
    test('Accessing index in Array', () {
      expect('JavaScript', person.Address.Favorites[0]());
    });
  });
}
