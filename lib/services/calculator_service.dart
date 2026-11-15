import 'dart:math';

import 'package:function_tree/function_tree.dart';

class CalculatorService {

  static String calculate(String expression) {

    try {

      /// BASIC OPERATORS
      expression =
          expression.replaceAll('×', '*');

      expression =
          expression.replaceAll('÷', '/');

      expression =
          expression.replaceAll('%', '/100');

      /// CONSTANTS
      expression =
          expression.replaceAll('π', '$pi');

      expression =
          expression.replaceAll('√', 'sqrt');

      expression =
          expression.replaceAll('x²', '^2');

      /// LOG FIX
      expression =
          expression.replaceAll('ln(', 'log(');

      /// CALCULATE
      num eval =
      expression.interpret();

      /// CLEAN RESULT
      if (eval.toString().endsWith('.0')) {

        return eval
            .toString()
            .replaceAll('.0', '');
      }

      return eval.toString();

    } catch (e) {

      return 'Error';
    }
  }
}