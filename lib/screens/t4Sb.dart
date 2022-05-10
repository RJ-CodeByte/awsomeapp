import 'package:awsomeapp/widgets//bgImage.dart';
import 'package:awsomeapp/widgets//drawer.dart';
import 'package:awsomeapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Task4Sb extends StatefulWidget {
  const Task4Sb({Key? key}) : super(key: key);

  @override
  State<Task4Sb> createState() => _Task4SbState();
}

class _Task4SbState extends State<Task4Sb> {


  Future getData() async {
    var url = "https://jsonplaceholder.typicode.com/photos";
    var res = await http.get(Uri.parse(url));
    var data = jsonDecode(res.body); // deseriallize
    print(data);
    return data;
  }

  Stream<List<String>> getStreamData(){
    var data= Stream<List<String>>.fromIterable([
      List<String>.generate(20, (index) => "Item $index")
    ]);
    return data;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Task 4 FB"),
        actions: [
          IconButton(
              onPressed: () {
                Constants.prefs.setBool("LoggedIn", false);
                Navigator.pushReplacementNamed(context, "/login");
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
        stream: getStreamData(),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text("Fetch Something"));
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text("Some Error"));
              }
              // return Text(snapshot.data[1].toString());
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(snapshot.data[index]),
                    ),
                  );
                },
                itemCount: snapshot.data.length,
              );
          }
        },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // myText = _nameController.text;
          // setState(() {});
        },
        child: Icon(Icons.refresh_rounded),
      ),
    );
  }
}
