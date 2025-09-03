import 'dart:io';

import 'package:exceptionact/exceptionact.dart' as exceptionact;

void main(List<String> arguments) {
  try {
    print('Enter the first number');
    int x = int.parse(stdin.readLineSync()!);
    print('Enter the second number');
    int y = int.parse(stdin.readLineSync()!);
    int val = x ~/ y;
    print('value:$val');

    if (val % 2 == 0) {
      print('$val is even number');
    } else {
      print('$val is Odd number');
    }
    if (val > 5) {
      custom();
    } else {
      print('value is lessthan 5');
    }
  } on customexception catch (e) {
    print(e.cause);
  } on IntegerDivisionByZeroException {
    print('Integer division by zero');
  }
}

void custom() {
  throw customexception('The value is greater than 5');
}

class customexception implements Exception {
  String cause;
  customexception(this.cause);
}
