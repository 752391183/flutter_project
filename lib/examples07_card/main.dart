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
      appBar: AppBar(),
      body: MyCard('情歌', '梁静茹'),
    );
  }
}

class MyCard extends StatelessWidget {
  final String name;
  final String singer;

  MyCard(this.name, this.singer);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 24,
        color: Colors.greenAccent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                  child: Icon(
                    Icons.android,
                    size: 30,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    Text(
                      singer,
                      style: TextStyle(fontSize: 18,color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Slider(value: 0.2, onChanged: (double value) {}),
            ),
            ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_left),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.stop),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  color: Colors.white,
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
