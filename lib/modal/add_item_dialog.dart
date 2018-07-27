import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shopping_cart_app/modal/card_item.dart';
import 'package:shopping_cart_app/redux/actions.dart';

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  String itemName;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CardItem>,OnItemCallBack>(
      converter: (store)=>(itemName)=>store.dispatch(AddItemAction(CardItem(name:itemName,checked:false))),
      builder: (context,callback)=> new AlertDialog(
        title: new Text("Add Item"),
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: "Item name",hintText: "Eg. iPhone"
                  ),
                onChanged: (value){
                     setState((){
                 itemName=value;
               });
                },
                ))
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              onPressed: (){Navigator.of(context).pop();},
              child: new Text("Cancel")),
          new FlatButton(
              onPressed: (){
                callback(itemName);
                Navigator.of(context).pop();},
              child: new Text("Add"))
        ],
      ),
    );


  }
}

typedef OnItemCallBack=Function(String itemName);