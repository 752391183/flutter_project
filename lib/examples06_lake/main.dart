import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[MyImage(), MyTitleSection(), MyIconSection(),MyTextSection()],
      ),
    );
  }
}

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset('images/src1575339131010.jpeg',
        fit: BoxFit.contain);
  }
}

class MyTitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(5, 8, 5, 8),
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Osetion Lake Comparerd',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(
                  'kasion afer',
                  style: TextStyle(fontSize: 10, color: Colors.black45),
                )
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red),
          Text('41')
        ],
      ),
    );
  }
}

class MyIconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _MyItem(Icon(Icons.call, color: Colors.blue,size: 20,), 'CALL'),
        _MyItem(Icon(Icons.near_me, color: Colors.blue,size: 20,), 'ROUTE'),
        _MyItem(Icon(Icons.share, color: Colors.blue,size: 20,), 'SHARE'),
      ],
    );
  }
}

class MyTextSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.'),
    );
  }
}

_MyItem(Icon icon, String str) {
  return Column(
    children: <Widget>[
      icon,
      Text(
        str,
        style: TextStyle(fontSize: 15, color: Colors.blue),
      )
    ],
  );
}
