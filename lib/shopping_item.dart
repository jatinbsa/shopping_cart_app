import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart_app/modal/card_item.dart';
import 'package:shopping_cart_app/redux/actions.dart';

class ShoppingItem extends StatefulWidget {
  final CardItem item;
  const ShoppingItem({Key key,this.item}): super(key:key);
  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CardItem>,OnItemDeleted>(
      converter: (store)=>(itemName) {
        store.dispatch(DeleteItemAction(widget.item));
      },
        builder: (context,callback)=> Dismissible(
            onDismissed: (_){
            setState(() {
              callback(widget.item.name);
              });
            },
            key: new Key(widget.item.name),

        child: StoreConnector<List<CardItem>,OnToggleStateAction>(
        converter: (store)=>(item)=>store.dispatch(ToggleStateItemAction(item)),
        builder: (context,callback)=>new ListTile(
        title: new Text(widget.item.name),
        leading: new Checkbox(value: widget.item.checked, onChanged: (value){
                setState(() {
                  callback(CardItem(name: widget.item.name,checked: value));
                });
              }),

            ),
          )),
    );
  }
}

typedef OnToggleStateAction=Function(CardItem item);
typedef OnItemDeleted=Function(String itemName);