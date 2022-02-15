import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    Key? key,
    required this.child,
    this.height = 1,
  }) : super(key: key);

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100 * height,
      padding: const EdgeInsets.all(1),
      child: child,
    );
  }
}
