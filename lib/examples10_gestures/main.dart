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
      body: ListView(
        children: <Widget>[
             MyGestureDetector('GestureDetector'),
          Divider(),
          MyInkWell('InkWell')
        ],
      ),
    );
  }
}

class MyGestureDetector extends StatelessWidget{
  final String _title;

  MyGestureDetector(this._title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            '你点击的是$_title'
          ),
          action: SnackBarAction(
            label: 'OK',
            onPressed: (){},
          ),
        ));
      },
      child: Container(
           margin: EdgeInsets.only(bottom: 10),
           child: Text(
             'GestureDetector',
             style: TextStyle(
               fontSize: 40,color: Colors.red
             ),
           ),
      ),
    );
  }
}


class MyInkWell extends StatelessWidget{
  final String _title;

  MyInkWell(this._title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      splashColor: Colors.lightBlueAccent,
      onTap: (){
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              '你点击的是$_title'
          ),
          action: SnackBarAction(
            label: 'OK',
            onPressed: (){},
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Text(
          'InkWell',
          style: TextStyle(
              fontSize: 40,color: Colors.red
          ),
        ),
      ),
    );
  }
}