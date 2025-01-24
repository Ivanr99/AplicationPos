import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/components/my_quantity_selector.dart';
import 'package:restaurant_app/models/cart_items.dart';
import 'package:restaurant_app/models/restaurant.dart';

class MyCartTitle extends StatelessWidget {
  final CartItems cartItems;

  const MyCartTitle({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItems.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),

                  const SizedBox(height: 10),

                  //name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(cartItems.food.name),

                      const SizedBox(height: 10),
                      //increment or decrement quantity
                      MyQuantitySelector(
                        quantity: cartItems.quantity,
                        food: cartItems.food,
                        onDecrement: () {
                          restaurant.removeFromCart(cartItems);
                        },
                        onIncrement: () {
                          restaurant.addToCart(
                              cartItems.food, cartItems.selectedAddons);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //addons
            SizedBox(
              height: cartItems.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                  right: 10,
                ),
                children: cartItems.selectedAddons
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Row(
                            children: [
                              //Addon name
                              Text(addon.name),

                              //Addon price
                              Text(' (\$${addon.price})'),
                            ],
                          ),
                          shape: StadiumBorder(
                              side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                          onSelected: (value) {},
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
