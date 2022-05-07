import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Flutter App",
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Awsome App"),
      ),
      body: Container(
        child: const Center(child: Text("Hii Flutter")),
      ),
    );
  }
}
