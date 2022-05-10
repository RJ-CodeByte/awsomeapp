import 'package:awsomeapp/models/newsInfo.dart';
import 'package:awsomeapp/services/api_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TaskWithModel extends StatefulWidget {
  const TaskWithModel({Key? key}) : super(key: key);

  @override
  State<TaskWithModel> createState() => _TaskWithModelState();
}

class _TaskWithModelState extends State<TaskWithModel> {
  late Future<NewsModel> _newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: Container(
        child: FutureBuilder<NewsModel>(
          future: _newsModel,

            builder:(context,AsyncSnapshot snapshot) {
            if(snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.articles.length,
                  itemBuilder: (context, index) {
                    var article = snapshot.data.articles[index];
                return Card(
                  child: Row(
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 5.0),
                      child: CircleAvatar(radius: 50.0, backgroundImage:NetworkImage(article.urlToImage)),
                    ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(article.title,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text(article.description,maxLines:2,overflow: TextOverflow.ellipsis,),
                            Text(article.content,maxLines: 1,overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      )
                  ],),
                );
              });
            }else
              {
                return Center(child: CircularProgressIndicator());
              }
          }
            )),
      );
  }
}
