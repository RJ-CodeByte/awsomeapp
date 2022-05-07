
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  get gradient => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Awsome App"),
        ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 5,
                    offset: Offset(2.0, 5.0))
              ],
              gradient: LinearGradient(colors: [Colors.yellow, Colors.pink])),
          // color: Colors.teal,
          width: 100,
          height: 100,
          child: Text(
            "I am a Box",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
