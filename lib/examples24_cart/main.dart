import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterexamplezsy/examples24_cart/models/catalogmodel.dart';
import 'package:flutterexamplezsy/examples24_cart/models/cartmodel.dart';
import 'package:flutterexamplezsy/examples24_cart/screens/cart.dart';
import 'package:flutterexamplezsy/examples24_cart/screens/catalog.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
       providers: [
         ChangeNotifierProvider(
           create: (_) => CartModel(),
         ),
         ChangeNotifierProvider(
           create: (_) => CatalogModel(),
         )
       ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/':(context) => Catalog(),
          "/cart":(context) => Cart(),
        },
      ),
    );
  }
  
}