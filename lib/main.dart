import 'package:calculator/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:calculator/home.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ProviderWidget());
}

class ProviderWidget extends StatelessWidget {
  const ProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primaryColor: const Color(0xffffb902),
        backgroundColor: const Color(0xff222433),
        brightness: Brightness.dark,
      ),
      home: const Home(),
    );
  }
}
