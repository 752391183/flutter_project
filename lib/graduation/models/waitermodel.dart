
import 'package:flutter/material.dart';

class Waiter {
  int id;
  String name;
  String password;
  Waiter(this.id, this.name, this.password);
}

class WaiterModel with ChangeNotifier {
   Waiter _waiter = Waiter(1, 'xp', '123456');
   bool _whetherLogin = false;


   bool getLogin() {
     return _whetherLogin;
   }

   setLogin(bool b) {
     _whetherLogin = b;
     notifyListeners();
   }

   login(String name, String password){
     if(name == _waiter.name && password == _waiter.password){
     _whetherLogin = true;
       notifyListeners();
     }
   }

}