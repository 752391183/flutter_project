import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:'My first App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'hello mygod',
      ),
    );
  }

}

class MyHomePage extends StatelessWidget{
  final String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(title),
          leading: Icon(Icons.access_alarms)
      ),
      body: Container(
        child: Text(
          'hello world',
        ),
      ),
    );
  }

}