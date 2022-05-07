import 'package:flutter/material.dart';

import 'bgImage.dart';

class ChangeNameCard extends StatelessWidget {
  const ChangeNameCard({
    Key? key,
    required this.myText,
    required TextEditingController nameController,
  })  : _nameController = nameController,
        super(key: key);

  final String myText;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BgImage(),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          myText,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _nameController,
          keyboardType: TextInputType.text,
          autofocus: false,
          decoration: InputDecoration(
            hintText: "Enter Something Here",
            labelText: "Name",
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ]);
  }
}
