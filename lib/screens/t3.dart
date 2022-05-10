import 'package:awsomeapp/widgets/bgImage.dart';
import 'package:awsomeapp/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/changeNameCard.dart';

class Task3 extends StatefulWidget {
  const Task3({Key? key}) : super(key: key);

  @override
  State<Task3> createState() => _Task3State();
}

class _Task3State extends State<Task3> {
  TextEditingController _nameController = TextEditingController();
  var myText = "Change Me";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Task 3"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            child:
                ChangeNameCard(myText: myText, nameController: _nameController),
          ),
        ),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          setState(() {});
        },
        child: Icon(Icons.refresh_rounded),
      ),
    );
  }
}
