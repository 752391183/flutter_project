import 'package:flutter/material.dart';

main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes:{
        MyHomePage.routeName:(context) {
          return MyHomePage();
        },
        MyCart.routeName:(context) {
          return MyCart();
        }
      }
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const routeName = '/';
  final Item item = Item('面包', 99);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('懒猫商城'),actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: (){
            Navigator.pushNamed(context,MyCart.routeName,arguments: item);
          },
        )
      ],),
    );
  }
}

class MyCart extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    Item item = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('购物车'),),
      body: Center(
        child: Text(
          'cart ${item.name}',
          style: TextStyle(
            fontSize: 40,
            color: Colors.blue
          ),
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final double price;

  Item(this.name, this.price);
}