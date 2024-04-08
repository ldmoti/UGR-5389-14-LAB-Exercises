import 'package:flutter/material.dart';
import 'package:lab4/pagey.dart';


void main() {
  runApp(const ScreenX());
}


class ScreenX extends StatelessWidget {
  const ScreenX({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen X"),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text("Next"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const ScreenY(),
                      settings: const RouteSettings(arguments: "data from x")));
            }),
      ),
    );
  }
}
