import 'package:calculator/buttons/buttons.dart';
import 'package:calculator/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumberButton extends StatelessWidget {
  String text;
  double size;

  NumberButton(this.text, {Key? key, this.size = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = context.read<DataProvider>();

    var buttonStyle = ElevatedButton.styleFrom(
      primary: const Color(0xff2c2f42),
      elevation: 0,
    );

    var textStyle = const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w400,
    );

    return ButtonContainer(
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () => dataProvider.pressNumber(text),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
