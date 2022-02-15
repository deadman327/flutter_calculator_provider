import 'package:calculator/components/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:calculator/components/components.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            const Expanded(child: SizedBox()),
            const Display(),
            ContainerRadius(child: const Keyboard()),
          ],
        ),
      ),
    );
  }
}
