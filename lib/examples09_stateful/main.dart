import 'package:flutter/material.dart';

main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:MyHomePage('Stateful Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String txt;

  MyHomePage(this.txt);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int _count;
  FloatingActionButtonLocation _location;

  @override
  void initState() {
    super.initState();
    _count=0;
  }

  _add() {
    _count++;
   _location = (_count + 1) % 2 == 0
        ? FloatingActionButtonLocation.centerFloat
        : FloatingActionButtonLocation.endFloat;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.txt)),
      body: Center(
        child: Text(
          'count:$_count',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButtonLocation: _location,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: _add,
      ),
    );
  }
}