import 'package:shopping_cart_app/modal/card_item.dart';
import 'package:shopping_cart_app/shopping_item.dart';

class AddItemAction{

  final CardItem cardItem;

  AddItemAction(this.cardItem);
}

class ToggleStateItemAction{
  final CardItem item;

  ToggleStateItemAction(this.item);
}

class DeleteItemAction{
  final CardItem item;

  DeleteItemAction(this.item);
  
}