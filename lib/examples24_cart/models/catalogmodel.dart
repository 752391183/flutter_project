
import 'package:flutter/material.dart';

class Product {
  double price;
  String name;

  Product(this.price, this.name);
}

class CatalogModel with ChangeNotifier{
  List<Product> _products = [];

   //添加商品信息
  addProducts(List<Product> p){
    _products = p;
    notifyListeners();
  }

  //列出商品信息
  List<Product> listProducts(){
    return _products;
  }
}