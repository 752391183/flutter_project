import 'package:flutter/material.dart';

main() =>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body:MyListView(30) ,
    );
  }
}

class MyListView extends StatelessWidget {
  final int count;

  MyListView(this.count);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
       padding: EdgeInsets.all(20),
      itemCount: count,
        itemBuilder: (_,index) {
        return MyItem('title$index','subtitle$index');
        },
       separatorBuilder: (context,index) {
         return Divider();
       },
    );
  }
}

class MyItem extends StatelessWidget{
  final String title;
  final String subTitle;
  MyItem(this.title,this.subTitle);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 20,color: Colors.blue
            ),
          ),
          Text(subTitle)
        ],
      ),
    );
  }
}