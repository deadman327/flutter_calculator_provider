import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class DataProvider with ChangeNotifier {
  final List<String> operators = ['/', 'x', '-', '+'];
  String _result = '';

  String get result => _result;

  void pressNumber(String number) {
    _result = '$result$number';
    notifyListeners();
  }

  void pressAction(String action) {
    if (result != '') {
      final last = result[result.length - 1];
      switch (action) {
        case 'del':
          _result = _result.substring(0, _result.length - 1);
          notifyListeners();
          break;

        case 'c':
          _result = '';
          notifyListeners();
          break;

        case '=':
          equalResult();
          break;

        default:
          if (!operators.contains(last)) {
            pressNumber(action);
          } else {
            _result = _result.substring(0, _result.length - 1) + action;
          }
          notifyListeners();
          break;
      }
    }
  }

  void equalResult() {
    final last = result[result.length - 1];
    if (!operators.contains(last)) {
      _result = _result.replaceAll('x', '*');

      Parser p = Parser();
      ContextModel cm = ContextModel();
      RegExp regex = RegExp(r"([.]*0+)(?!.*\d)");

      String exp =
          p.parse(_result).evaluate(EvaluationType.REAL, cm).toStringAsFixed(3);

      _result = exp.toString().replaceAll(regex, '');
      notifyListeners();
    }
  }
}
