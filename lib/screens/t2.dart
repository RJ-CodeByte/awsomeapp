import 'package:flutter/material.dart';

class Task2 extends StatelessWidget {
  const Task2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task 2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            color: Colors.black,
            width: 200,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                padding: const EdgeInsets.all(8),
                width: 100,
                height: 100,
                color: Colors.green,
              ),     
                  Container(
                padding: const EdgeInsets.all(8),
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: 100,
                height: 100,
                color: Colors.red,
              )          
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
