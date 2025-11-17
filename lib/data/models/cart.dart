import 'package:locabite/data/models/meal.dart';

class Cart {
  String? cartcode;
  List<CartItem>? cartItems;

  Cart({this.cartItems, this.cartcode});
}

class CartItem {
  Cart? cart;
  Meal? meal;
  String? id;
  int? quantity;

  CartItem({this.cart, this.meal, this.id, this.quantity});
}
