# dynamic_function
[![Pub](https://img.shields.io/pub/v/dynamic_function.svg)](https://pub.dartlang.org/packages/dynamic_function)

The dynamic_function package was created mainly for supporting variable length parameter function for dart3.
If you use dynamic_function package for dart 3.7.2, you can allow optional positional and optional named arguments in the same function. See this gist:
https://gist.github.com/javacommons/2446ce18252aa7623607f0ccd2aaf570

## Variable length parameter function demo

```
// func_demo.dart
import 'package:dynamic_function/dynamic_function.dart';

final dynamic sum = DynamicFunction((
  List<dynamic> positional,
  Map<Symbol, dynamic> named,
) {
  print('positional.length=${positional.length}');
  int result = 0;
  for (int i = 0; i < positional.length; i++) {
    result += positional[i] as int;
  }
  return result;
});

void main() {
  int answer = sum(11, 22, 33);
  print('answer=$answer');
}

/*
[Result]
positional.length=3
answer=66
 */
```

```
// class_demo.dart
import 'package:dynamic_function/dynamic_function.dart';

class MyNumber {
  final int _num;

  MyNumber(this._num);

  late final dynamic addNumbers = DynamicFunction((
    List<dynamic> positional,
    Map<Symbol, dynamic> named,
  ) {
    print('positional.length=${positional.length}');
    int result = _num;
    for (int i = 0; i < positional.length; i++) {
      result += positional[i] as int;
    }
    return result;
  });
}

void main() {
  final myNum = MyNumber(11);
  int answer = myNum.addNumbers(22, 33);
  print('answer=$answer');
}

/*
[Result]
positional.length=2
answer=66
 */
```
