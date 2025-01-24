import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/components/my_button.dart';
import 'package:restaurant_app/components/my_cart_title.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/services/database/firestore.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  FirestoreService db = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        //scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: const Text("Orden"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //Clear cart button
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                          "Estas seguro de que quieres limpiar el carrito?"),
                      actions: [
                        //cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("No"),
                        ),

                        //yes button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text("Si"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              )
            ],
          ),
          body: Column(
            children: [
              // list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text("El carrito esta vacio"),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                //get individual cart item
                                final cartItem = userCart[index];

                                //return cart title UI
                                return MyCartTitle(cartItems: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),

              //button to pay
              MyButton(
                text: "Realizar Pedido",
                onTap: () {
                  String receipt =
                      context.read<Restaurant>().displayCartReceipt();
                  db.saveOrderToDataBase(receipt);
                  restaurant.clearCart();
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
