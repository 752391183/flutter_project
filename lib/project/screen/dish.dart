import 'package:flutter/material.dart';
import 'package:flutterexamplezsy/project/model/cartmodel.dart';
import 'package:flutterexamplezsy/project/model/dishmodel.dart';
import 'package:flutterexamplezsy/project/model/tablemodel.dart';
import 'package:provider/provider.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back
            ),
          onPressed: (){
             Navigator.of(context).pushNamed("/");
          },
        ),
        title: Text("菜单"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () => Navigator.of(context).pushNamed("/cart"))
        ],
        /*bottom: TabBar(
          tabs: _getMyTable().map((t) => t.tab).toList(),
        ),*/
      ),
      body: Column(
         children: <Widget>[
           Expanded(child:DishList()),
           Row(
             children: <Widget>[
               Expanded(
                 child: ToTalPrice(),
               ),
               CurrentTable(),
               RaisedButton(
                 onPressed: () {
                   showModalBottomSheet(
                       context: context,
                       builder: (context) {
                         return DishModal();
                       });
                 },
                 child: Text('换桌'),),
             ],
           )
         ],
       ),
      );
  }
/*  _getMyTable() {
    return[
      MyTab(
          Tab(icon: Icon(Icons.tab)),
          DishList(count)
      ),
      MyTab(
          Tab(icon: Icon(Icons.tab)),
          DishList(count)
      ),
      MyTab(
          Tab(icon: Icon(Icons.tab)),
          DishList(count)
      )
    ];
  }*/
}


/*
class MyTab {
  Tab tab;
  Widget body;

  MyTab(this.tab, this.body);
}*/
class CurrentTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<TableModel>(builder: (context, table, widght){
      return Text('当前为 ${table.getCurrentTable().id} 号桌');
    });
  }

}

class DishList extends StatefulWidget {
/*  final int i ;

  DishList(this.i);*/

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DishListState();
  }
}

class DishListState extends State<DishList> {
  DishModel dish;
  CartModel cart;


  @override
  void initState() {
    super.initState();
      _load();
  }


  @override
  void dispose() {
    _load().dispose;
    super.dispose();
  }

  _load() async {
   /* if(count ==1) {
      Future.delayed(Duration.zero, () => dish.loadDisheFoods());
    }
    if(count == 2) {
      Future.delayed(Duration.zero, () => dish.loadDisheFoods());
    }
    if(count ==3) {
      Future.delayed(Duration.zero, () => dish.loadDisheFoods());
    }*/
    List<Dish> dishes = await await Future.delayed(Duration(seconds: 2),(){
      return[
        Dish(1, '南瓜吐司', 50,image: Image.asset('images/cai1.jpg', fit: BoxFit.contain,),detail: 'this is a 南瓜吐司'),
        Dish(2, '红烧包肉', 500, image: Image.asset('images/cai2.jpg', fit: BoxFit.contain,), detail: 'this is a 红烧包肉'),
        Dish(3, '千叶豆腐', 26, image:Image.asset('images/cai3.jpg', fit: BoxFit.contain,), detail: 'this is a 千叶豆腐'),
        Dish(4, '青菜拌蒜', 40,image: Image.asset('images/cai4.jpg', fit: BoxFit.contain,),detail: 'this is a 青菜拌蒜'),
        Dish(5, '可乐雪碧', 10,image: Image.asset('images/jiushui1.jpg', fit: BoxFit.contain,),detail: 'this is a 可乐雪碧'),
        Dish(6, '红酒啤酒', 1,image: Image.asset('images/jiushui2.jpg', fit: BoxFit.contain,),detail: 'this is a 红酒啤酒'),
        Dish(7, '草莓蛋糕', 10,image: Image.asset('images/tianping1.jpg', fit: BoxFit.contain,),detail: 'this is a 草莓蛋糕'),
        Dish(8, '草莓奶酪', 10,image: Image.asset('images/tianping2.jpg', fit: BoxFit.contain,),detail: 'this is a 草莓奶酪'),

      ];
    });
   // if(dish.listDishes() == null)
    dish.addDishes(dishes);
  }

  @override
  Widget build(BuildContext context) {
    dish = Provider.of<DishModel>(context);
    cart = Provider.of<CartModel>(context);
    // TODO: implement build
    return dish
        .listDishes()
        .length == 0
        ? Center(
      child: CircularProgressIndicator(),
    )
        :
     ListView.separated(
        padding: EdgeInsets.all(5),
        // todo 这里可以后期添加图片之类的
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                child: dish.listDishes()[index].image,
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.grey,
                  child: Column(
                    children: <Widget>[
                      Text('${dish.listDishes()[index].name}', style: TextStyle(
                          fontSize: 28
                      )),
                      Text('${dish.listDishes()[index].price}',
                        style: TextStyle(fontSize: 20),)
                    ],
                  ),
                  onTap: () {
                    dish.setCurrentDish(dish.listDishes()[index]);
                    Navigator.of(context).pushNamed('/dishDetail');
                  },
                ),
              ),

              IconButton(icon: Icon(Icons.remove), onPressed: () {
                _remove(dish.listDishes()[index]);
              }),
              SizedBox(
                  width: 16,
                  child: ItemCount(dish.listDishes()[index])
              ),
              IconButton(icon: Icon(Icons.add), onPressed: () {
                _add(dish.listDishes()[index]);
              })
            ],
          );
        },
        separatorBuilder: (_, __) {
          return Divider();
        },
        itemCount: dish
            .listDishes()
            .length);
  }

  _add(Dish d) {
    cart.addItem(d);
  }

  _remove(Dish d) {
    cart.removeItem(d);
  }
  }


class ItemCount extends StatelessWidget {
  final Dish dish;

  ItemCount(this.dish);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CartModel>(
      builder: (c, cart, child) {
        return Text('${cart.getItemCount(dish)}');
      },
    );
  }

}


class ToTalPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CartModel>(builder: (context, cart, widght) {
      return Text('总额:${cart.getTotalPrice()}',
        style: TextStyle(color: Colors.red, fontSize: 30),);
    });
  }

}

class DishModal extends StatelessWidget {
  TableModel tableModel;

  @override
  Widget build(BuildContext context) {
    tableModel = Provider.of<TableModel>(context);
    // TODO: implement build
    return Container(
      height: 300,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    '暂时还空闲的桌子',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              CloseButton()
            ],
          ),
          Divider(),
          Expanded(
            child: ListView.separated(
              itemCount: tableModel
                  .listCouldChange()
                  .length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${tableModel.listCouldChange()[index].id} 号桌'),
                  trailing: RaisedButton(
                      child: Text('换桌'),
                      onPressed: () {
                        tableModel.changeTable(tableModel
                            .getCurrentTable()
                            .id - 1, tableModel.listCouldChange()[index].id -
                            1);
                        Navigator.pop(context);
                      }),
                );
              },
              separatorBuilder: (_, index) => Divider(),
            ),
          )
        ],
      ),
    );
  }

}



