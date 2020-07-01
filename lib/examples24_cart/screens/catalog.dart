import 'package:flutter/material.dart';
import 'package:flutterexamplezsy/examples24_cart/models/cartmodel.dart';
import 'package:flutterexamplezsy/examples24_cart/models/catalogmodel.dart';
import 'package:flutterexamplezsy/examples24_cart/screens/cart.dart';
import 'package:provider/provider.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '商品'
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.of(context).pushNamed('/cart'),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
          child: ProductList(),
        ),
         TotalPrice()
        ],
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return ProductListState();
  }
}

class ProductListState extends State<ProductList> {
  CatalogModel catalog;
  CartModel cart;

  @override
  void initState() {
    super.initState();
   _load();
  }

  //模拟进入页面的网络请求
 _load() async {
    List<Product> products = await Future.delayed(Duration(seconds: 2),(){
    return [
      Product(1.5,'面包'),
      Product(2.5,'火肠'),
      Product(1.2,'坚果'),
      Product(3.0,'鸡蛋'),
      Product(2.5,'瓜子'),
      Product(3.5,'面条'),
      Product(9.5,'巧克力'),
    ];
    });
    catalog.addProducts(products);
 }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    catalog = Provider.of<CatalogModel>(context);
    cart = Provider.of<CartModel>(context,listen: false);
     return catalog.listProducts().length == 0
         ? Center(
       child: CircularProgressIndicator(),
     )
         : ListView.separated(
          padding: EdgeInsets.all(5),
         itemBuilder: (context,index){
             return Row(
               children: <Widget>[
                 Expanded(
                   child: Column(
                     children: <Widget>[
                       Text(
                         '${catalog.listProducts()[index].name}',
                         style: TextStyle(
                           fontSize: 28
                         ),
                       ),
                       Text(
                         '${catalog.listProducts()[index].price}',
                         style: TextStyle(
                           fontSize: 20
                         ),
                       )
                     ],
                   ),
                 ),
                 IconButton(
                   icon: Icon(Icons.remove),
                   onPressed: (){
                     _remove(catalog.listProducts()[index]);
                   },
                 ),
                 SizedBox(
                   width: 16,
                   child: ItemCount(
                     catalog.listProducts()[index]
                   ),
                 ),
                 IconButton(
                   icon: Icon(Icons.add),
                   onPressed: () {
                     _add(catalog.listProducts()[index]);
                   },
                 )
               ],

             );
         },
         separatorBuilder: (_,__) => Divider(),
         itemCount: catalog.listProducts().length);
  }

  _remove (Product p) {
      cart.removeItem(p);
  }
  _add (Product p) {
    cart.addItem(p);
  }
}

class ItemCount extends StatelessWidget {
   final Product product;
   ItemCount(this.product);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Consumer<CartModel>(
     builder: (c,cart,child){
       return Text('${cart.getItemCount(product)}');
     }
   );
  }
}

class TotalPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CartModel>(
      builder: (context,cart,child) {
        return Text(
          '总额：${cart.getTotalPrice()}',
          style: TextStyle(
            color: Colors.red,
            fontSize: 40
          ),
        );
      }
    );
  }
}