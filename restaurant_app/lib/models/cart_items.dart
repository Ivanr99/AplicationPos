import 'package:restaurant_app/models/food.dart';

class CartItems {
  Food food;
  List<Addon> selectedAddons;
  int quantity;

  CartItems({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalprice {
    double addonsPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);

    return (food.price + addonsPrice) * quantity;
  }
}
