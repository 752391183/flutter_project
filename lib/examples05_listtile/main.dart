import 'package:flutter/material.dart';

main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body:MyListTile(),
    );
  }
}

class MyListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        _getMyListTile(Icon(Icons.access_alarm), '热爱', '生活', context),
        _getMyListTile(Icon(Icons.access_alarm), '拥抱', '生活', context),
        Divider(),
        _getMyListTile(Icon(Icons.access_alarm), '享受', '生活', context, trailing: Icon(Icons.more_horiz)),
      ],
    );
  }
}

ListTile _getMyListTile(Icon icon, String title, String subTitle,
    BuildContext context, {Icon trailing}) {
  return ListTile(
    leading: icon,
    title: Text(title,style: TextStyle(
      fontSize: 20,
      color: Colors.blue
    )),
    subtitle: Text(subTitle),
    trailing: trailing,
    onTap: () {},
  );
}