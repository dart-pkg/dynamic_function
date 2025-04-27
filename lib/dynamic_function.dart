import 'dart:core';

/// Prototype of dynamic function
typedef FunctionWithArguments =
    dynamic Function(
      List<dynamic> positionalArguments,
      Map<Symbol, dynamic> namedArguments,
    );

class DynamicFunction {
  final FunctionWithArguments _function;

  /// Constructor of DynamicFunction
  DynamicFunction(this._function);

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.isMethod && invocation.memberName == const Symbol('call')) {
      return _function(
        invocation.positionalArguments,
        invocation.namedArguments,
      );
    }
    return null;
  }
}

/// Checks named parameters
void checkNamed(
  Map<Symbol, dynamic> named,
  List<String> optionalNames, [
  List<String>? requiredNames,
]) {
  requiredNames ??= <String>[];
  final List<Symbol> optionalSyms =
      optionalNames.map(($x) => Symbol($x)).toList();
  final List<Symbol> requiredSyms =
      requiredNames.map((x) => Symbol(x)).toList();
  final keys = named.keys.toList();
  for (int i = 0; i < keys.length; i++) {
    var key = keys[i];
    if ((!optionalSyms.contains(key)) && (!requiredSyms.contains(key))) {
      throw Exception('Unexpected named parameter: $key');
    }
  }
  for (int i = 0; i < requiredSyms.length; i++) {
    var sym = requiredSyms[i];
    if (!keys.contains(sym)) {
      throw Exception('Required named parameter $sym not supplied');
    }
  }
}
