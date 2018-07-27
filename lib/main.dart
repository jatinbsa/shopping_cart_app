import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:shopping_cart_app/modal/card_item.dart';
import 'package:shopping_cart_app/shopping_cart.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart_app/redux/reducers.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

void main() {
  final store=new DevToolsStore<List<CardItem>>(cardItemReducer,initialState: new List());
  runApp(new MyApp(store:store));
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.4

  final DevToolsStore<List<CardItem>> store;

  const MyApp({Key key,this.store}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'Shopping App',
        theme: new ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: new ShoppingCart(store:store),
      ),
    );
  }
}

