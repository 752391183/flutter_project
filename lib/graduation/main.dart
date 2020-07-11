import 'package:flutter/material.dart';
import 'package:flutterexamplezsy/graduation/models/cartlogmodel.dart';
import 'package:flutterexamplezsy/graduation/models/cartmodel.dart';
import 'package:flutterexamplezsy/graduation/models/tablemodel.dart';
import 'package:flutterexamplezsy/graduation/models/waitermodel.dart';
import 'package:flutterexamplezsy/graduation/screens/dish.dart';
import 'package:flutterexamplezsy/graduation/screens/loginpage.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) =>WaiterModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartlogModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartModel(),
        ),
        ChangeNotifierProvider(
          create:(_) => MyTableModel(),
        )
    ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/dish':(context) => Catalog(),
        },
      ),);
  }
}