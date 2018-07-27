import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:shopping_cart_app/modal/add_item_dialog.dart';
import 'package:shopping_cart_app/modal/card_item.dart';
import 'package:shopping_cart_app/shopping_list.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';

class ShoppingCart extends StatelessWidget {
  final DevToolsStore<List<CardItem>> store;

  const ShoppingCart({Key key,this.store}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Shopping Cart"),
      ),
      body: new ShoppingList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: ()=>_openAddItemDialog(context),
        child: new Icon(Icons.add),
      ),
      endDrawer: new ReduxDevTools(store),
    );

  }
  _openAddItemDialog(BuildContext context){
         showDialog(context: context,
            builder: (context)=>new AddItemDialog()
         );
  }

}
