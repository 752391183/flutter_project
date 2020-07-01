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

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.red,
        currentIndex: _currentIndex,
        items: _getMyBottom(),
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
      //不支持左右滑动
        body: IndexedStack(
          index: _currentIndex,
          children: _listBottomBody(),
        )

      //支持左右滑动
      /*
      body: PageView.builder(
          itemCount: _listBottomBody().length,
          onPageChanged: (int index) {
            _currentIndex = index;
            setState(() {});
          },
          itemBuilder: (context, index) {
            return _listBottomBody()[_currentIndex];
          }),
      */
    );
  }
}

_getMyBottom() {
  return [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
    BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('Message')),
    BottomNavigationBarItem(icon: Icon(Icons.person_add), title: Text('Add')),
    BottomNavigationBarItem(icon: Icon(Icons.call), title: Text('Call'))
  ];
}

List<MyContainer> _listBottomBody() {
  return [
    MyContainer('Home'),
    MyContainer('Message'),
    MyContainer('Add'),
    MyContainer('Call')
  ];
}

class MyContainer extends StatelessWidget {
  final String title;

  MyContainer(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(5),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
    );
  }
}
