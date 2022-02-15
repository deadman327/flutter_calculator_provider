import 'package:flutter/material.dart';

class ContainerRadius extends StatelessWidget {
  Widget child;

  ContainerRadius({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration containerRadius = const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    );

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: containerRadius,
      child: child,
    );
  }
}
