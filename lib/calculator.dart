import 'number-formatter.dart';
import 'dart:math' as math;

class Calculations {
  static const PERIOD = '.';
  static const MULTIPLY = '*';
  static const SUBTRACT = '-';
  static const ADD = '+';
  static const DIVIDE = '/';
  static const POWER = '^';
  static const REMAIN = '%';
  static const CLEAR = 'CR';
  static const EQUAL = '=';
  static const DISCOUNT = '🛍️';
  static const INTEREST = '📈️';
  static const REVERSE_INTEREST = '〽️';
  static const BITMUL = '⬆️';
  static const BITDIV= '⬇️';
  static const OPERATIONS = [
    Calculations.ADD,
    Calculations.MULTIPLY,
    Calculations.SUBTRACT,
    Calculations.DIVIDE,
    Calculations.POWER,
    Calculations.REMAIN,
    Calculations.DISCOUNT,
    Calculations.INTEREST,
    Calculations.REVERSE_INTEREST,
    Calculations.BITMUL,
    Calculations.BITDIV,
  ];

  static double add(double a, double b) => a + b;
  static double subtract(double a, double b) => a - b;
  static double multiply(double a, double b) => a * b;
  static double power(double a, double b) => math.pow(a, b);
  static double remain(double a, double b) => a % b;
  static double discount(double a, double b) => a - (a ~/ 100 * b);
  static double interest(double a, double b) => a ~/ 100 * b;
  static double binMultiply(double a) => a * 1024;

  static double binDivide(double a) {
    double ret = a / 1024;
    int fac = math.pow(10, 3);
    return (ret * fac).round() / fac;
  }

  static double divide(double a, double b) {
    double ret = a / b;
    int fac = math.pow(10, 3);
    return (ret * fac).round() / fac;
  }

  static double reverseInterest(double a, double b) {
    double ret = (b - a) * (100 / a);
    int fac = math.pow(10, 3);
    return (ret * fac).round() / fac;
  }
}

class Calculator {
  static String parseString(String text) {
    List<String> resultNumbers;
    double a, b, result;
    if (text.contains(Calculations.ADD)) {
      resultNumbers = text.split(Calculations.ADD);
      a = double.parse((resultNumbers[0]));
      b = double.parse((resultNumbers[1]));
      result = Calculations.add(a, b);
    }
    else if (text.contains(Calculations.MULTIPLY)) {
      resultNumbers = text.split(Calculations.MULTIPLY);
      a = double.parse((resultNumbers[0]));
      b = double.parse((resultNumbers[1]));
      result = Calculations.multiply(a, b);
    }
    else if (text.contains(Calculations.DIVIDE)) {
      resultNumbers = text.split(Calculations.DIVIDE);
      a = double.parse((resultNumbers[0]));
      b = double.parse((resultNumbers[1]));
      result = Calculations.divide(a, b);
    }
    else if (text.contains(Calculations.SUBTRACT)) {
      resultNumbers = text.split(Calculations.SUBTRACT);
      a = double.parse((resultNumbers[0]));
      b = double.parse((resultNumbers[1]));
      result = Calculations.subtract(a, b);
    }
    else if (text.contains(Calculations.POWER)) {
      resultNumbers = text.split(Calculations.POWER);
      a = double.parse((resultNumbers[0]));
      b = double.parse((resultNumbers[1]));
      result = Calculations.power(a, b);
    }
    else if (text.contains(Calculations.REMAIN)) {
      resultNumbers = text.split(Calculations.REMAIN);
      a = double.parse((resultNumbers[0]));
      b = double.parse((resultNumbers[1]));
      result = Calculations.remain(a, b);
    }
    else if (text.contains(Calculations.DISCOUNT)) {
      resultNumbers = text.split(Calculations.DISCOUNT);
      a = double.parse((resultNumbers[0]));
      b = double.parse((resultNumbers[1]));
      result = Calculations.discount(a, b);
    }
    else if (text.contains(Calculations.INTEREST)) {
      resultNumbers = text.split(Calculations.INTEREST);
      a = double.parse((resultNumbers[0]));
      b = double.parse((resultNumbers[1]));
      result = Calculations.interest(a, b);
    }
    else if (text.contains(Calculations.REVERSE_INTEREST)) {
      resultNumbers = text.split(Calculations.REVERSE_INTEREST);
      a = double.parse((resultNumbers[0]));
      b = double.parse((resultNumbers[1]));
      result = Calculations.reverseInterest(a, b);
    }
    else if (text.contains(Calculations.BITMUL)) {
      resultNumbers = text.split(Calculations.BITMUL);
      a = double.parse((resultNumbers[0]));
      result = Calculations.binMultiply(a);
    }
    else if (text.contains(Calculations.BITDIV)) {
      resultNumbers = text.split(Calculations.BITDIV);
      a = double.parse((resultNumbers[0]));
      result = Calculations.binDivide(a);
    }
    else {
      return text;
    }

    return NumberFormatter.format(result.toString());
  }

  static String addPeriod(String calculatorString) {
    if (calculatorString.isEmpty) {
      return calculatorString = '0${Calculations.PERIOD}';
    }

    RegExp exp = new RegExp(r"\d\.");
    Iterable<Match> matches = exp.allMatches(calculatorString);
    int maxMatches = Calculator.includesOperation(calculatorString) ? 2 : 1;

    return matches.length == maxMatches
        ? calculatorString
        : calculatorString += Calculations.PERIOD;
  }

  static bool includesOperation(String calculatorString) {
    for (var operation in Calculations.OPERATIONS) {
      if (calculatorString.contains(operation)) {
        return true;
      }
    }

    return false;
  }
}
