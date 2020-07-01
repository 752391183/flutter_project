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
    // TODO: implement buildre
    return DefaultTabController(
      length: _getMyTabs().length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab1'),
          bottom: TabBar(
            tabs: _getMyTabs().map((t) => t.tab).toList(),
          ),
        ),
          body: TabBarView(
            children: _getMyTabs().map((t) => t.body).toList()
            ,
          ),
      ),
    );
  }
}

List<MyTab> _getMyTabs() {
  return [
    MyTab(
      Tab(icon: Icon(Icons.directions_car)),
      Icon(Icons.directions_car,color: Colors.pink,size: 60)
    ),
    MyTab(
        Tab(icon: Icon(Icons.directions_bike)),
        Icon(Icons.directions_bike,color: Colors.pink,size: 60)
    ),
    MyTab(Tab(icon: Icon(Icons.directions_bus)),
            Icon(Icons.directions_bus,color: Colors.pink,size: 60)
    )
  ];
}

class MyTab {
  Tab tab;
  Widget body;

  MyTab(this.tab, this.body);

}