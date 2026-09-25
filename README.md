# dynamic_json

dynamic_json is a tiny Dart package, written in 2019, that lets you read values from decoded JSON (a `Map`) with dot syntax, the way you would in JavaScript, instead of chains of string keys in square brackets. You pass a map to the `Dynamic` function and get back a `DynamicObject`. Each property access on that object, such as `person.Address.City`, returns another `DynamicObject` that wraps the nested value, and calling the final one like a function, `person.Address.City()`, returns the actual value. List elements are read with an index, as in `person.Address.Favorites[0]()`. It works through Dart's `noSuchMethod` hook: the object is used as `dynamic`, and each unknown getter name is turned into a map key lookup at runtime. A missing key or an out-of-range index gives `null` instead of throwing. The package has no dependencies, a small unit test suite, and version 0.0.1 is published on pub.dev. It targets Dart 2 (`>=2.1.0 <3.0.0`) and has not been updated since.

> Version 0.0.1, published February 2019. Not actively maintained.

## Features

- Dot access to map keys: `obj.Key()`
- Chained access to nested maps: `obj.Outer.Inner()`
- List indexing inside a chain: `obj.List[0]()`
- Returns the whole wrapped value when called without a key: `obj.List()` returns the list
- Missing keys and out-of-range indexes return `null`

## Tech stack

Dart 2 · package:test · package:pedantic (lints)

## Installation

Add the package to `pubspec.yaml`:

```yaml
dependencies:
  dynamic_json: ^0.0.1
```

Then run `dart pub get` (or `pub get` on older SDKs).

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

When you chain calls, the last call must end with parentheses, as if calling a function, to get the actual value. Without them you get another `DynamicObject`.

## How it works

`Dynamic(map)` wraps the map in a `DynamicObject`. Because the result is typed `dynamic`, the Dart compiler accepts any member name. At runtime, `DynamicObject.noSuchMethod` handles each call:

- A getter on a wrapped `Map` looks up the key with the getter's name and wraps the result in a new `DynamicObject`.
- `[index]` on a wrapped `List` returns the element at that index, wrapped.
- Calling the object (`()`) returns the wrapped value itself.

## Development

```bash
dart pub get
dart test                              # runs test/dynamic_json_test.dart
dart run example/dynamic_json_example.dart
```

## Limitations

- The SDK constraint `<3.0.0` means the package does not resolve with Dart 3 without changing `pubspec.yaml`.
- Only keys that are valid Dart identifiers can be read with dot syntax; there is no `obj['some-key']` access on maps.
- All access is dynamic, so there is no static type checking or IDE completion for keys.
- The `homepage` in `pubspec.yaml` and on pub.dev still uses the old GitHub account name `marsa-emreef`.

## License

MIT. See [LICENSE.md](LICENSE.md).
