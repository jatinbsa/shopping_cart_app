

import 'package:shopping_cart_app/modal/card_item.dart';

import 'actions.dart';

List<CardItem> cardItemReducer(List<CardItem> items,dynamic action){
   if(action is AddItemAction){
     return addItem(items, action);
   }
   else if(action is ToggleStateItemAction){
     return toggleState(items, action);
   }
   else if(action is DeleteItemAction){
    return deleteItem(items, action);
   }
   return items;
}

List<CardItem> addItem(List<CardItem> items,AddItemAction action){
  return new List.from(items)..add(action.cardItem);
}


List<CardItem> toggleState(List<CardItem> items,ToggleStateItemAction action){
  List<CardItem> newItems=items.map((items)=>items.name==action.item.name?action.item:items).toList();
  return newItems;
}

List<CardItem> deleteItem(List<CardItem> items,DeleteItemAction action){
  return new List.from(items)..remove(action.item);
}