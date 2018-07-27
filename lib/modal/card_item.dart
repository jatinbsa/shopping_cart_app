 import 'package:meta/meta.dart';
class CardItem{
  String name;
  bool checked;

  CardItem({@required this.name,@required this.checked});

  @override
  String toString() {
    // TODO: implement toString
    return "$name: $checked";
  }
}