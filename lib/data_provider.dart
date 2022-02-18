import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class DataProvider with ChangeNotifier {
  final List<String> operators = ['/', 'x', '-', '+', '%'];
  String _data = '';
  bool _isResult = false;

  String get data => _data;

  void pressNumber(String number) {
    if (_isResult) {
      _data = '';
      _isResult = false;
    }
    _data = '$data$number';
    notifyListeners();
  }

  void pressAction(String action) {
    if (data != '') {
      final last = data[data.length - 1];

      switch (action) {
        case '.':
          final regEx = RegExp(r'[^\d\.]');
          final arrayData = data.split(regEx);

          if (!arrayData[arrayData.length - 1].contains('.')) {
            pressNumber(action);
          }
          break;
        case 'del':
          _data = _data.substring(0, _data.length - 1);
          notifyListeners();
          break;

        case '=':
          equalResult();
          break;

        case 'AC':
          _data = '';
          notifyListeners();
          break;

        default:
          if (!operators.contains(last) && !_isResult) {
            pressNumber(action);
          } else if (operators.contains(last)) {
            _data = _data.substring(0, _data.length - 1) + action;
            notifyListeners();
          } else {
            _isResult = false;
            pressNumber(action);
          }
          break;
      }
    }
  }

  void equalResult() {
    final last = data[data.length - 1];
    if (!operators.contains(last)) {
      _data = _data.replaceAll('x', '*');

      Parser p = Parser();
      ContextModel cm = ContextModel();
      RegExp regex = RegExp(r"([.]*0+)(?!.*\d)");

      String exp =
          p.parse(_data).evaluate(EvaluationType.REAL, cm).toStringAsFixed(3);

      _data = exp.toString().replaceAll(regex, '');
      _isResult = true;
      notifyListeners();
    }
  }
}
