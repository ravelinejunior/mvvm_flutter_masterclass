import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();

  int appState = 0;

  static final MyApp myAppInstance = MyApp._internal(); //Singleton
  factory MyApp() => myAppInstance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
