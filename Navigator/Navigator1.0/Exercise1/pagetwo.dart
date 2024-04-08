import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Two"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text("Back"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
