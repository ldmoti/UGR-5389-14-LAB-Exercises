import 'package:flutter/material.dart';
import 'package:lab4/pageone.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navigation Demo',
      home: ScreenOne(),
    );
  }
}
