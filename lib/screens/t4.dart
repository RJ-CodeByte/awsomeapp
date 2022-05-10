import 'package:awsomeapp/widgets//bgImage.dart';
import 'package:awsomeapp/widgets//drawer.dart';
import 'package:awsomeapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Task4 extends StatefulWidget {
  const Task4({Key? key}) : super(key: key);

  @override
  State<Task4> createState() => _Task4State();
}

class _Task4State extends State<Task4> {
  TextEditingController _nameController = TextEditingController();
  var myText = "Change Me";
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body); // deseriallize
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Task 4"),
        actions: [
          IconButton(onPressed: (){
            Constants.prefs.setBool("LoggedIn", false);
            Navigator.pushReplacementNamed(context, "/login");
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: data != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(data[index]["title"]),
                      subtitle: Text("ID: ${data[index]["id"]}"),
                      leading: Image.network(data[index]["url"]),
                      // trailing: Image.network(data[index]["thumbnailUrl"]),
                    ),
                  );
                },
                itemCount: data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
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
