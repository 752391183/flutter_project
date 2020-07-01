import 'package:flutter/material.dart';

main() =>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'demo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text('demo'),
       leading: Icon(Icons.accessibility),
     ),
     body: Text('hello'),
   );
  }
}
