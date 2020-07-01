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
    return Scaffold(appBar: _buildMyAppBar());
  }
}

_buildMyAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(50.0),
    child: AppBar(
      leading: IconButton(icon: Icon(Icons.person_add), onPressed: () {}),
      title: Text('我的应用'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.person_add),
          onPressed: () {},
        ),
        _buildPopupMenuButton()
      ],
    ),
  );
}

PopupMenuButton _buildPopupMenuButton() {
  return PopupMenuButton(
    onSelected: (value) {},
    icon: Icon(Icons.person_add),
    itemBuilder: (BuildContext context) {
      return [
        PopupMenuItem(
          value: 1,
          child: ListTile(
            leading: Icon(Icons.person_add),
            title: Text('扫一扫'),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: ListTile(
            leading: Icon(Icons.person_add),
            title: Text('收钱'),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: ListTile(
            leading: Icon(Icons.person_add),
            title: Text('乘车码'),
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          value: 4,
          child: ListTile(
            leading: Icon(Icons.person_add),
            title: Text('智能助理'),
          ),
        ),
      ];
    },
  );
}
