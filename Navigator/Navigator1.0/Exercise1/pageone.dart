import 'package:flutter/material.dart';
import 'package:lab4/pagetwo.dart';


class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen One"),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text("Next"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const ScreenTwo()));
            }),
      ),
    );
  }
}
