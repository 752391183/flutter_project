import 'package:flutter/material.dart';

class Waiter {

  String name;
  String password;

  Waiter(this.name, this.password);
}

class WaiterModel with ChangeNotifier{
  Waiter _waiter = Waiter('xp', '123456');
  bool _isLogin = false;

  Waiter getWaiter() {
    return _waiter;
  }

  bool getIsLogin() {
    return _isLogin;
  }

  void setIsLogin(bool b){
    _isLogin = b;
    notifyListeners();
  }

  login(String name, String password){
    if(name == _waiter.name && password == _waiter.password){
      _isLogin = true;
      notifyListeners();
    }
  }

}