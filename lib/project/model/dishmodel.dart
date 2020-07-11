import 'package:flutter/material.dart';

class Dish {
  int id;
  String name;
  double price;
  Image image;
  String detail;

  Dish(this.id, this.name, this.price, {this.image, this.detail});
}

class DishModel with ChangeNotifier {
  List<Dish> _dishes = [];
  Dish _currentDish;

  Dish getCurrentDish() {
    return _currentDish;
  }

  void setCurrentDish(Dish dish) {
    _currentDish = dish;
    notifyListeners();
  }

  List<Dish> listDishes() {
    return _dishes;
  }

 addDishes(List<Dish> d) {
    _dishes = d;
    notifyListeners();
  }
}