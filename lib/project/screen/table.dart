import 'package:flutter/material.dart';
import 'package:flutterexamplezsy/project/model/tablemodel.dart';
import 'package:flutterexamplezsy/project/model/waitermodel.dart';

import 'package:provider/provider.dart';

class MyTableScreen extends StatelessWidget{
  WaiterModel waiterModel;
  @override
  Widget build(BuildContext context) {
    waiterModel = Provider.of<WaiterModel>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('餐桌情况'),
        // todo
      ),
      body: TableList(),
      drawer: MyDrawer.getInstance(),
    );
  }
}

class TableList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TableListState();
  }
}

class TableListState extends State<TableList>{
  TableModel table;
  WaiterModel waiterModel;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load(){
    Future.delayed(Duration(seconds: 2), () => table.loadTables());
  }

  @override
  Widget build(BuildContext context) {
    table = Provider.of<TableModel>(context);
    waiterModel = Provider.of<WaiterModel>(context);
    // TODO: implement build
    return table.listTables().length == 0
        ? Center(
      child: CircularProgressIndicator(),
    ) : ListView.separated(
        itemBuilder: (context, index){
          return ListTile(
            leading: Icon(Icons.restaurant),
            title: Text('${index + 1}号桌'),
            subtitle: Text('${table.listTables()[index].seats}人桌'),
            trailing: table.listTables()[index].sitable == false ?
            Text('已有人入座') :
            RaisedButton(
                child: Text('入座'),
                onPressed: (){
                  table.sit(index);
                  table.setCurrentTable(table.listTables()[index]);
                  Navigator.of(context).pushNamed('/dish');
                }
            ),
          );
        },
        separatorBuilder: (_,__)=> Divider(),
        itemCount: table.listTables().length)
    ;
  }
}

class MyDrawer extends StatelessWidget {
  WaiterModel waiterModel;
  static final MyDrawer _myDrawer = MyDrawer();
  Waiter waiter;

  MyDrawer();
  factory MyDrawer.getInstance() {
    return _myDrawer;
  }

  @override
  Widget build(BuildContext context) {
    waiter = Provider.of<WaiterModel>(context).getWaiter();
    waiterModel = Provider.of<WaiterModel>(context);
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _getDrawerHeader(waiter),
          ..._getListTiles(context)
        ],
      ),
    );
  }

  DrawerHeader _getDrawerHeader(Waiter waiter) {
    return DrawerHeader(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
         margin: EdgeInsets.only(top: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          /*  Container(
              width: 110,
              child: FittedBox(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/chifan.jpeg'),
//                ),
                  radius: 100,
                ),
              ),
            ),*/
            Text(
              '服务员姓名：${waiter.name}',
              style: TextStyle(fontSize: 15,color: Colors.white),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/chifan.jpeg')
          )
      ),
    );
  }

  List<Widget> _getListTiles(BuildContext context) {
    return [
      ListTile(
        leading: Icon(Icons.assistant),
        trailing: Icon(Icons.chevron_right),
        title: Text('统计订单'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.monetization_on),
        trailing: Icon(Icons.chevron_right),
        title: Text('查看提成'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.account_circle),
        trailing: Icon(Icons.chevron_right),
        title: Text('激活会员'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ];
  }
}