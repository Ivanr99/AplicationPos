import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_app/models/cart_items.dart';
import 'package:restaurant_app/models/food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    //viral
    Food(
      name: "Pitufo",
      description: "Sprite, Energetizante, vodka, curazao y gomitas",
      imagePath: "lib/images/viral/pitufo.png",
      price: 99,
      category: FoodCategory.viral,
      avaibleAddons: [
        Addon(name: "1 L", price: 99),
        Addon(name: "1/2 L", price: 55),
        Addon(name: "Extra alcohol", price: 10),
      ],
    ),
    Food(
      name: "Pantera",
      description: "Ameyal, ron, granadina y gomitas",
      imagePath: "lib/images/viral/pantera.png",
      price: 99,
      category: FoodCategory.viral,
      avaibleAddons: [
        Addon(name: "1 L", price: 99),
        Addon(name: "1/2 L", price: 55),
        Addon(name: "Extra alcohol", price: 10),
      ],
    ),
    Food(
      name: "Barney",
      description: "Delawer, vodka y gomitas",
      imagePath: "lib/images/viral/barney.png",
      price: 99,
      category: FoodCategory.viral,
      avaibleAddons: [
        Addon(name: "1 L", price: 99),
        Addon(name: "1/2 L", price: 55),
        Addon(name: "Extra alcohol", price: 10),
      ],
    ),
    Food(
      name: "Hulk",
      description: "Sprite, vodka, caribe de manzana y gomitas",
      imagePath: "lib/images/viral/pantera.png",
      price: 99,
      category: FoodCategory.viral,
      avaibleAddons: [
        Addon(name: "1 L", price: 99),
        Addon(name: "1/2 L", price: 55),
        Addon(name: "Extra alcohol", price: 10),
      ],
    ),
    Food(
      name: "Licuachela",
      description: "Cerveza en envase de licuadora",
      imagePath: "lib/images/viral/pantera.png",
      price: 119,
      category: FoodCategory.viral,
      avaibleAddons: [
        Addon(name: "Corona", price: 119),
        Addon(name: "Victoria", price: 119),
        Addon(name: "XX lager", price: 119),
        Addon(name: "Indio", price: 119),
        Addon(name: "Heineken", price: 119),
        Addon(name: "Cubana", price: 0),
        Addon(name: "Tradicional", price: 0),
        Addon(name: "Clamato", price: 0),
        Addon(name: "Ajonjoli", price: 0),
        Addon(name: "Miguelito", price: 0),
        Addon(name: "Limon y Sal", price: 0),
      ],
    ),
    Food(
      name: "KittyChela",
      description: "Cerveza en envase de Kitty",
      imagePath: "lib/images/viral/pantera.png",
      price: 95,
      category: FoodCategory.viral,
      avaibleAddons: [
        Addon(name: "Corona", price: 0),
        Addon(name: "Victoria", price: 0),
        Addon(name: "XX lager", price: 0),
        Addon(name: "Indio", price: 0),
        Addon(name: "Heineken", price: 0),
        Addon(name: "Cubana", price: 0),
        Addon(name: "Tradicional", price: 0),
        Addon(name: "Clamato", price: 0),
        Addon(name: "Ajonjoli", price: 0),
        Addon(name: "Miguelito", price: 0),
        Addon(name: "Limon y Sal", price: 0),
      ],
    ),
    Food(
      name: "Penelope",
      description: "Cerveza en envase de Pene",
      imagePath: "lib/images/viral/pantera.png",
      price: 95,
      category: FoodCategory.viral,
      avaibleAddons: [
        Addon(name: "Corona", price: 0),
        Addon(name: "Victoria", price: 0),
        Addon(name: "XX lager", price: 0),
        Addon(name: "Indio", price: 0),
        Addon(name: "Heineken", price: 0),
        Addon(name: "Cubana", price: 0),
        Addon(name: "Tradicional", price: 0),
        Addon(name: "Clamato", price: 0),
        Addon(name: "Ajonjoli", price: 0),
        Addon(name: "Miguelito", price: 0),
        Addon(name: "Limon y Sal", price: 0),
      ],
    ),
    Food(
      name: "Tinachela",
      description: "Cerveza en envase de Tina",
      imagePath: "lib/images/viral/pantera.png",
      price: 85,
      category: FoodCategory.viral,
      avaibleAddons: [
        Addon(name: "Corona", price: 0),
        Addon(name: "Victoria", price: 0),
        Addon(name: "XX lager", price: 0),
        Addon(name: "Indio", price: 0),
        Addon(name: "Heineken", price: 0),
        Addon(name: "Cubana", price: 0),
        Addon(name: "Tradicional", price: 0),
        Addon(name: "Clamato", price: 0),
        Addon(name: "Ajonjoli", price: 0),
        Addon(name: "Miguelito", price: 0),
        Addon(name: "Limon y Sal", price: 0),
      ],
    ),
    Food(
      name: "Yarda",
      description: "Cerveza en envase de Yarda",
      imagePath: "lib/images/viral/pantera.png",
      price: 95,
      category: FoodCategory.viral,
      avaibleAddons: [
        Addon(name: "Corona", price: 0),
        Addon(name: "Victoria", price: 0),
        Addon(name: "XX lager", price: 0),
        Addon(name: "Indio", price: 0),
        Addon(name: "Heineken", price: 0),
        Addon(name: "Cubana", price: 0),
        Addon(name: "Tradicional", price: 0),
        Addon(name: "Clamato", price: 0),
        Addon(name: "Ajonjoli", price: 0),
        Addon(name: "Miguelito", price: 0),
        Addon(name: "Limon y Sal", price: 0),
      ],
    ),
    Food(
      name: "Pelonchela",
      description: "Cerveza en envase de Pelon",
      imagePath: "lib/images/viral/pantera.png",
      price: 109,
      category: FoodCategory.viral,
      avaibleAddons: [
        Addon(name: "Corona", price: 0),
        Addon(name: "Victoria", price: 0),
        Addon(name: "XX lager", price: 0),
        Addon(name: "Indio", price: 0),
        Addon(name: "Heineken", price: 0),
        Addon(name: "Cubana", price: 0),
        Addon(name: "Tradicional", price: 0),
        Addon(name: "Clamato", price: 0),
        Addon(name: "Ajonjoli", price: 0),
        Addon(name: "Miguelito", price: 0),
        Addon(name: "Limon y Sal", price: 0),
      ],
    ),

    //preparados
    Food(
      name: "Mojito",
      description: "",
      imagePath: "lib/images/preparados/mojito.png",
      price: 89,
      category: FoodCategory.preparados,
      avaibleAddons: [
        Addon(name: "1 L", price: 89),
        Addon(name: "1/2 L", price: 55),
        Addon(name: "Frutos Rojos", price: 0),
        Addon(name: "Mango", price: 0),
        Addon(name: "Pepino", price: 0),
      ],
    ),
    Food(
      name: "Margarita",
      description: "",
      imagePath: "lib/images/preparados/margarita.png",
      price: 89,
      category: FoodCategory.preparados,
      avaibleAddons: [
        Addon(name: "Frutos Rojos", price: 0),
        Addon(name: "Mango", price: 0),
        Addon(name: "Tradicional", price: 0),
      ],
    ),
    Food(
      name: "Sunraise",
      description: "",
      imagePath: "lib/images/preparados/sunraise.png",
      price: 89,
      category: FoodCategory.preparados,
      avaibleAddons: [
        Addon(name: "Alcohol Extra", price: 10),
      ],
    ),
    Food(
      name: "Perla Negra",
      description: "",
      imagePath: "lib/images/preparados/perlanegra.png",
      price: 89,
      category: FoodCategory.preparados,
      avaibleAddons: [
        Addon(name: "Alcohol Extra", price: 10),
      ],
    ),
    Food(
      name: "Charro negro",
      description: "",
      imagePath: "lib/images/preparados/charro.png",
      price: 68,
      category: FoodCategory.preparados,
      avaibleAddons: [
        Addon(name: "Alcohol Extra", price: 10),
      ],
    ),
    Food(
      name: "Quemadita",
      description: "",
      imagePath: "lib/images/preparados/charro.png",
      price: 68,
      category: FoodCategory.preparados,
      avaibleAddons: [
        Addon(name: "Alcohol Extra", price: 10),
      ],
    ),
    Food(
      name: "Paloma",
      description: "",
      imagePath: "lib/images/preparados/paloma.png",
      price: 68,
      category: FoodCategory.preparados,
      avaibleAddons: [
        Addon(name: "Alcohol Extra", price: 10),
      ],
    ),

    //cerveza
    Food(
      name: "Cerveza de Media",
      description: "Cerveza de 325 ml",
      imagePath: "lib/images/cerveza/cerveza.png",
      price: 0,
      category: FoodCategory.cerveza,
      avaibleAddons: [
        Addon(name: "Corona", price: 35),
        Addon(name: "Victoria", price: 35),
        Addon(name: "Heineken", price: 35),
        Addon(name: "Heineken Silver", price: 35),
        Addon(name: "XX lager", price: 28),
        Addon(name: "XX Ambar", price: 28),
        Addon(name: "Indio", price: 28),
        Addon(name: "Tecate", price: 28),
        Addon(name: "Amstel", price: 32),
        Addon(name: "Cubana", price: 12),
        Addon(name: "Tradicional", price: 12),
        Addon(name: "Clamato", price: 12),
        Addon(name: "Ajonjoli", price: 0),
        Addon(name: "Miguelito", price: 0),
        Addon(name: "Limon y Sal", price: 0),
      ],
    ),
    Food(
      name: "Cerveza Caguama",
      description: "Cerveza",
      imagePath: "lib/images/cerveza/caguama.png",
      price: 0,
      category: FoodCategory.cerveza,
      avaibleAddons: [
        Addon(name: "Corona", price: 79),
        Addon(name: "Victoria", price: 79),
        Addon(name: "Heineken", price: 75),
        Addon(name: "XX lager", price: 75),
        Addon(name: "Indio", price: 75),
        Addon(name: "Tecate", price: 75),
        Addon(name: "Cubana", price: 15),
        Addon(name: "Tradicional", price: 15),
        Addon(name: "Clamato", price: 15),
        Addon(name: "Ajonjoli", price: 0),
        Addon(name: "Miguelito", price: 0),
        Addon(name: "Limon y Sal", price: 0),
      ],
    ),

    //botellas
    Food(
      name: "Vodka",
      description: "Botella con 4 mescladores",
      imagePath: "lib/images/botellas/vodka.png",
      price: 0,
      category: FoodCategory.botellas,
      avaibleAddons: [
        Addon(name: "Absolut Mango", price: 618),
        Addon(name: "Absolut Tradicional", price: 618),
        Addon(name: "Absolut Smoky Pina", price: 678),
        Addon(name: "Absolut Lime", price: 618),
        Addon(name: "Absolut Raspberri", price: 618),
        Addon(name: "Smirnoff", price: 518),
        Addon(name: "Smirnoff Tamarindo", price: 518),
      ],
    ),
    Food(
      name: "Tequila",
      description: "Botella con 4 mescladores",
      imagePath: "lib/images/botellas/tequila.png",
      price: 0,
      category: FoodCategory.botellas,
      avaibleAddons: [
        Addon(name: "Hornitos", price: 678),
        Addon(name: "Herradura Plata", price: 958),
        Addon(name: "Centenario Plata", price: 594),
        Addon(name: "Baby Mango", price: 454),
        Addon(name: "Centenario Azul Reposado", price: 510),
        Addon(name: "Jose Cuervo Reposado", price: 804),
        Addon(name: "Jose Cuervo Plata", price: 748),
        Addon(name: "Jose Cuervo Especial", price: 426),
        Addon(name: "Don Julio 70", price: 1888),
        Addon(name: "Maestro Dobel", price: 1519),
      ],
    ),

    //comida
    Food(
      name: "Papas a la Francesa",
      description: "Papas con salchicha",
      imagePath: "lib/images/comida/papas.png",
      price: 55,
      category: FoodCategory.comida,
      avaibleAddons: [
        Addon(name: "Con Todo", price: 0),
        Addon(name: "SIN Valentina", price: 0),
        Addon(name: "SIN Catsup", price: 0),
        Addon(name: "SIN Queso", price: 0),
        Addon(name: "SIN Mayonesa", price: 0),
      ],
    ),
    Food(
      name: "Enchiladas",
      description: "Enchiladas con pollo",
      imagePath: "lib/images/comida/papas.png",
      price: 75,
      category: FoodCategory.comida,
      avaibleAddons: [
        Addon(name: "Con Todo", price: 0),
        Addon(name: "SIN Cebolla", price: 0),
        Addon(name: "SIN Lechuga", price: 0),
        Addon(name: "SIN Queso", price: 0),
        Addon(name: "SIN Crema", price: 0),
      ],
    ),

    //sinalcohol
    Food(
      name: "Heineken 0.0",
      description: "Cerveza Sin Alcohol de 250 ml",
      imagePath: "lib/images/sinalcohol/cerveza.png",
      price: 28,
      category: FoodCategory.sinalcohol,
      avaibleAddons: [
        Addon(name: "Preparada", price: 40),
      ],
    ),
  ];

  //user cart
  final List<CartItems> _cart = [];
  // delivery adress(wich user can chnage/update)
  String _deliveryAdress = '99 Hollywood Blv';

  //Getters
  List<Food> get menu => _menu;
  List<CartItems> get cart => _cart;
  String get deliveryAdress => _deliveryAdress;

  //Operations

  // Add to cart
  void addToCart(Food food, List<Addon> selectAddons) {
    // see if there is a cart item already with the same food and selected addons
    //to get firstWhereOrNull run on the terminal  => flutter pub add collection
    CartItems? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectAddons);

      return isSameFood && isSameAddons;
    });

    //if item already exist , increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      //otherwise, add a new cart item to the cart
      _cart.add(
        CartItems(
          food: food,
          selectedAddons: selectAddons,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItems cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of the cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItems cartItems in _cart) {
      double itemTotal = cartItems.food.price;

      for (Addon addon in cartItems.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItems.quantity;
    }

    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemsCount = 0;

    for (CartItems cartItems in _cart) {
      totalItemsCount += cartItems.quantity;
    }

    return totalItemsCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAdress = newAddress;
    notifyListeners();
  }

  //HELPERS
  // Generated a receip
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();

    //format the date to incude up to seconds only, add the dependency to dormat date=> flutter pub add intl
    String formatDate =
        DateFormat('yyyy-mm-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formatDate);
    receipt.writeln();
    receipt.writeln("-----------");

    for (final CartItems in _cart) {
      receipt.writeln(
          "${CartItems.quantity} x ${CartItems.food.name} - ${CartItems.food.price}");
      if (CartItems.selectedAddons.isNotEmpty) {
        receipt
            .writeln("    Add-ons: ${_formatAddons(CartItems.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("-----------------");
    receipt.writeln();
    receipt.writeln("Total items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of Addons  into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
