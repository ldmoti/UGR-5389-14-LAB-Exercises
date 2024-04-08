import 'package:flutter/material.dart';
import 'package:lab4/pageone.dart';
import 'package:lab4/pagetwo.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const ScreenOne(),
        '/second': (context) => const ScreenTwo(),
      },
    );
  }
}