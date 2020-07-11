import 'package:flutter/material.dart';
import 'package:flutterexamplezsy/project/model/cartmodel.dart';
import 'package:flutterexamplezsy/project/model/dishmodel.dart';
import 'package:flutterexamplezsy/project/model/tablemodel.dart';
import 'package:flutterexamplezsy/project/model/waitermodel.dart';
import 'package:flutterexamplezsy/project/screen/cart.dart';
import 'package:flutterexamplezsy/project/screen/dish.dart';
import 'package:flutterexamplezsy/project/screen/dishdetail2.dart';
import 'package:flutterexamplezsy/project/screen/login.dart';
import 'package:flutterexamplezsy/project/screen/table.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_)=> DishModel(),
      ),
      ChangeNotifierProvider(
        create: (_)=>CartModel(),
      ),
      ChangeNotifierProvider(
        create: (_)=>TableModel(),
      ),
      ChangeNotifierProvider(
        create: (_)=>WaiterModel(),
      ),
    ],
      child: MaterialApp(
        initialRoute: '/login',
        routes: {
          '/': (context) => MyTableScreen(),
          '/dish': (context) => Catalog(),
          '/cart': (context) => Cart(),
          '/dishDetail': (context) => DishDetail2(),
          '/login': (context) => Login(),
        },
      ),);
  }

}