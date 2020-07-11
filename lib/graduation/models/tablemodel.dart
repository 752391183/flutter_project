
import 'package:flutter/material.dart';

class MyTable {
  int id;
  bool sitable;//能否入座
  int seats;

  MyTable(this.id, this.sitable, this.seats); //桌子人数

}

class MyTableModel with ChangeNotifier {
  List<MyTable> _tables = [];
  List<MyTable> _couldChange = [];
  MyTable _currentTable;

  MyTable getCurrentTable() {
    return _currentTable;
  }
  addCurrentTable(MyTable table) {
    _currentTable = table;
    notifyListeners();
  }

  List<MyTable> listTables() {
    return _tables;
  }
  addTables(List<MyTable> list) {
    _tables = list;
    notifyListeners();
  }

  List<MyTable> listCouldChange() {
    for(MyTable m in _tables) {
      if(m.sitable == true) {
        _couldChange.add(m);
      }
    }
    notifyListeners();
    return _couldChange;
  }

  //选择入座
  sit(int index) {
    _tables[index].sitable = false;
    notifyListeners();
  }

  changeTable(int oldIndex,int newIndex) {
    _tables[oldIndex].sitable = true;
    _tables[newIndex].sitable = false;
    _currentTable = _tables[newIndex];
    notifyListeners();
  }
  //离开
  takeOff(int index) {
    _tables[index].sitable = true;
    notifyListeners();
  }
}