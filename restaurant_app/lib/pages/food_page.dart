import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/components/my_button.dart';
import 'package:restaurant_app/models/food.dart';
import 'package:restaurant_app/models/restaurant.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    //initialice the select addons to be false
    for (Addon addon in food.avaibleAddons) {
      selectAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    //close the current food page to go back to menu
    Navigator.pop(context);

    //format the selected addons
    List<Addon> currentlySelectedAddons = [];

    for (Addon addon in widget.food.avaibleAddons) {
      if (widget.selectAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    //add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            //ayuda a hacer scroll y no danar la vista por no tener espacio
            child: Column(
              children: [
                //food image
                Image.asset(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      const SizedBox(height: 10),

                      //food description
                      Text(widget.food.description),

                      const SizedBox(height: 10),

                      Divider(
                        color: Theme.of(context).colorScheme.primary,
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Add-ons",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      //Addons
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.tertiary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.zero,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.food.avaibleAddons.length,
                          itemBuilder: (context, index) {
                            //get individual Addon
                            Addon addon = widget.food.avaibleAddons[index];

                            //return check box IU
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                '\$${addon.price}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              value: widget.selectAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // button -> add to cart
                MyButton(
                  text: "Add to cart",
                  onTap: () => addToCart(widget.food, widget.selectAddons),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),

        //Back Button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
