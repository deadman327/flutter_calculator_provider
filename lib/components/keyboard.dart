import 'package:calculator/buttons/buttons.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            ActionButton(text: 'c'),
            NumberButton('1'),
            NumberButton('4'),
            NumberButton('7'),
          ],
        ),
        Column(
          children: [
            ActionButton(
              text: '/',
              color: primaryColor,
            ),
            NumberButton('2'),
            NumberButton('5'),
            NumberButton('8'),
            NumberButton('0'),
          ],
        ),
        Column(
          children: [
            ActionButton(
              text: 'x',
              color: primaryColor,
            ),
            NumberButton('3'),
            NumberButton('7'),
            NumberButton('9'),
          ],
        ),
        Column(
          children: [
            ActionButton(
              text: 'del',
              icon: Icons.backspace_outlined,
              color: primaryColor,
            ),
            ActionButton(
              text: '-',
              color: primaryColor,
            ),
            ActionButton(
              text: '+',
              color: primaryColor,
            ),
            ActionButton(
              text: '=',
              background: primaryColor,
              height: 2,
            ),
          ],
        ),
      ],
    );
  }
}
