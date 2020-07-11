
import 'package:flutter/material.dart';

class Dish {
  int id;
  String name;
  double price;
  Image image;
  String detail;

  Dish(this.id,this.name,this.price,{this.image,this.detail});
}

class CartlogModel with ChangeNotifier {
    List<Dish> _dishes = [];
    Dish _currentDish;
   //获得当前商品信息
    Dish getCurrentDish() {
      return _currentDish;
    }
    addCurrentDish(Dish ds) {
      _currentDish = ds;
      notifyListeners();
    }


  //列出商品信息
  List<Dish> listDishes() {
    return _dishes;
  }

    loadDishes() async{
      _dishes = await Future.delayed(Duration(seconds: 2),(){
        return[
          Dish(1, '雷劈青龙', 50,image: Image.asset('images/chifan.jpeg', fit: BoxFit.contain,),detail: '嗯对，就是拍黄瓜'),
          Dish(2, '群英荟萃', 500, image: Image.asset('images/chifan.jpeg', fit: BoxFit.contain,), detail: '萝卜开会'),
          Dish(3, '鱼香肉丝', 26, image:Image.asset('images/chifan.jpeg', fit: BoxFit.contain,), detail: '我老乐吃了'),
          Dish(4, '锅包又', 40,image: Image.asset('images/chifan.jpeg', fit: BoxFit.contain,),detail: '百度有请')
        ];
      });
      notifyListeners();
    }
}