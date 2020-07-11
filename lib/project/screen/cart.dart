import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterexamplezsy/project/model/cartmodel.dart';
import 'package:flutterexamplezsy/project/model/tablemodel.dart';
import 'package:flutterexamplezsy/project/screen/dish.dart';

import 'package:provider/provider.dart';

class Cart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('购物单'),
        actions: <Widget>[
          _buildPopupMenuButton(context)
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: ItemList()),
          ToTalPrice(),
        ],
      )
    );
  }

}

class ItemList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CartModel>(
      builder: (c, cart, child){
        return ListView.separated(
            itemBuilder: (c, index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('${cart.items[index].dish.name}',
                    style: TextStyle(fontSize: 30),),
                  Text('数量: ${cart.items[index].count}')
                ],
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: cart.items.length);
      },
    );

  }

}

class CartModal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(30),
//      child: Image.asset('images/3.jpg',fit: BoxFit.contain,),
      child: Image.asset('images/erweima.jpg',fit: BoxFit.contain,),
    );
  }

}

class CartModal2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('撤桌成功'),
              RaisedButton(
                child: const Text('确认'),
                onPressed: () => Navigator.of(context).pushNamed('/'),
              )
            ],
          ),
        ));
  }

}

PopupMenuButton _buildPopupMenuButton(BuildContext context) {
  TableModel tableModel;
  tableModel = Provider.of<TableModel>(context);
  return PopupMenuButton(
    onSelected: (value) {},
    icon: Icon(Icons.add),
    itemBuilder: (BuildContext context) {
      return [
        PopupMenuItem(
          value: 1,
          child: ListTile(
            leading: Icon(Icons.aspect_ratio),
            title: Text('扫一扫'),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CartModal();
                  });
            },
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: ListTile(
            leading: Icon(Icons.backspace),
            title: Text('撤桌'),
            onTap: () {
              tableModel.takeoff(tableModel.getCurrentTable().id -1);
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CartModal2();
                  });
            },
          ),
        ),
      ];
    },
  );
}