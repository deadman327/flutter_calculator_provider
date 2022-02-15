import 'package:calculator/buttons/buttons.dart';
import 'package:calculator/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionButton extends StatelessWidget {
  String text;
  Color background;
  Color color;
  IconData? icon;
  double height;

  ActionButton({
    Key? key,
    required this.text,
    this.background = const Color(0xff34374a),
    this.color = const Color(0xffffffff),
    this.icon,
    this.height = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = context.watch<DataProvider>();

    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      primary: background,
      elevation: 0,
    );

    TextStyle textStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w400,
      color: color,
    );

    return ButtonContainer(
      height: height,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () => dataProvider.pressAction(text),
        child: icon != null
            ? Icon(icon, color: color)
            : Text(text, style: textStyle),
      ),
    );
  }
}
