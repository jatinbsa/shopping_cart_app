import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart_app/modal/card_item.dart';
import 'package:shopping_cart_app/shopping_item.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CardItem>,List<CardItem>>(
      converter: (store)=>store.state,
      builder: (context,list)=> new ListView.builder(
          itemBuilder: (context,i)=>new ShoppingItem(item:list[i]),itemCount: list.length,

      ),
    );
  }
}
