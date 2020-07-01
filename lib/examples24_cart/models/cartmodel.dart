
import 'package:flutter/material.dart';
import 'package:flutterexamplezsy/examples24_cart/models/catalogmodel.dart';

class Item {
  int count;
  Product product;

  Item(this.count ,this.product);
}

class CartModel with ChangeNotifier{
  List<Item> _item = [];

  //列出购物车商品信息
  List<Item> get items => _item;


  //添加商品到购物车
  addItem(Product p){
   Item item = _item.firstWhere((i) => i.product == p,orElse: () => null);
   if(item == null){
     item = Item(0,p);
     _item.add(item);
   }
   item.count++;
   notifyListeners();
  }

  //删除购物车商品
  removeItem(Product p) {
    Item item = _item.firstWhere((i) => i.product == p,orElse: () => null);
    if(item == null){
      return;
    }
    item.count--;
    if(item.count == 0){
      _item.remove(item);
    }
     notifyListeners();
  }

  //获取购物车中商品的数量
  int getItemCount(Product p){
    Item item = _item.firstWhere((i) => i.product == p,orElse: ()=> null);
    return item ==null ? 0 : item.count;
  }

  //计算总额,取小数点后一位
    String getTotalPrice() {
    double sum = 0;
    for(var item in _item){
      sum += item.product.price*item.count;
    }
    return sum.toStringAsFixed(1);
   }
}