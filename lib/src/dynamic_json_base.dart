/**
 * DynamicObject is a proxy object that have references to actual object.
 * DynamicObject is useful if we want to take values from a Map using dot
 * operators as in JavaScript. If we make a chain call with a dot operator, the
 * last call must be closed with curly brackets. If we do not close with curly
 * brackets, the value returned from the operation is another DynamicObject class.
 *
 * marsa.emreef@gmail.com
 */
class DynamicObject {
  final _actual;

  /**
   * Constructors of dynamic objects require references from the actual object
   */
  DynamicObject(this._actual);

  @override
  noSuchMethod(Invocation invocation) {
    var result;
    if (invocation.isGetter && _actual is Map) {
      result = _getValueBySymbol(invocation.memberName);
    } else if (invocation.isMethod) {
      if (_isSymbolOfAnonymousFunction(invocation.memberName)) {
        return _actual;
      }
      if (_actual is List &&
          _isSymbolForArrayOperation(invocation.memberName)) {
        final index = invocation.positionalArguments[0];
        if (index >= 0 && index < (_actual as List).length) {
          result = _actual[index];
        }
      } else if (_actual is Map) {
        return _getValueBySymbol(invocation.memberName);
      }
    }
    return new DynamicObject(result);
  }

  /**
   * Take the value of the actual object based on the member Symbol.
   */
  _getValueBySymbol(Symbol memberName) {
    final val = _actual[_getSymbolName(memberName)] ?? _actual[memberName];
    return val;
  }

  /**
   * Take the name of the Symbol object.
   */
  String _getSymbolName(Symbol memberName) {
    final memberNameString = memberName.toString();
    return memberNameString.substring(
        "Symbol('".length, memberNameString.length - 2);
  }

  /**
   * Validate if the symbol is actually an array operation.
   */
  bool _isSymbolForArrayOperation(Symbol memberName) {
    return _getSymbolName(memberName) == '[]';
  }

  /**
   * Validate if the operation is an anonymous call
   */
  bool _isSymbolOfAnonymousFunction(Symbol memberName) {
    return _getSymbolName(memberName) == 'call';
  }
}

/**
 * This function is used to convert Map / JSON to a DynamicObject.
 * We can retrieve values from a Map using dot operations, and chaining like in javascript.
 *
 * Examples :
 * * final person = Dynamic({ "FirstName" : "John" , "LastName" : "Doe" , "Address" :{ "City" : "Dubai" , "Phone" : "050123456"  , "Favorites" : ["JavaScript","ActionScript","Java","Dart"]}});
 * * print(person.FirstName()); // John
 * * print(person.Address.City()); // Dubai
 * * print(person.Address.Favorites[0]()); // JavaScript
 *
 */
Function(Map value) get Dynamic => (Map value) {
      return DynamicObject(value);
    };
