import 'package:calculator/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Display extends StatelessWidget {
  const Display({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DataProvider>();

    const textStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w400,
    );

    return Container(
      width: Size.infinite.width,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Text(provider.result, style: textStyle),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
