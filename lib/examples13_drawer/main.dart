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
      appBar: AppBar(
        title: Text('My Drawer'),
      ),
      body: Center(
        child: Text(
          'This a Drawer',
          style: TextStyle(fontSize: 30, color: Colors.blue),
        ),
      ),
      drawer: MyDrawer.getInstance(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  static final MyDrawer _myDrawer = MyDrawer();

  MyDrawer();

  factory MyDrawer.getInstance() {
    return _myDrawer;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[MyDrawerHeader(), ..._getListTiles(context)],
      ),
    );
  }
}

class MyDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DrawerHeader(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        children: <Widget>[
          Container(
            width: 110,
            child: FittedBox(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/src1575339131010.jpeg'),
                radius: 100,
              ),
            ),
          ),
          Text(
            'MyDrawer',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          Text(
            '面朝大海，春暖花开',
            style: TextStyle(fontSize: 10, color: Colors.white),
          )
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/chifan.jpeg')
        )
      ),
    );
  }
}

_getListTiles(BuildContext context) {
  return [
    ListTile(
      leading: Icon(Icons.assistant),
      trailing: Icon(Icons.chevron_right),
      title: Text('激活会员'),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    ListTile(
      leading: Icon(Icons.wallpaper),
      trailing: Icon(Icons.chevron_right),
      title: Text('我的相册'),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    Divider(),
    ListTile(
      leading: Icon(Icons.markunread),
      title: Text('我的文件'),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    ListTile(
      leading: Icon(Icons.aspect_ratio),
      title: Text('扫一扫'),
      onTap: () {
        Navigator.pop(context);
      },
    ),
  ];
}
