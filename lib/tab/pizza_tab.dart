import 'package:donut_app/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
   PizzaTab({super.key});

  // Lista de pizzas
  final List pizzaOnSale = [
    ['Spicy', '180', Colors.red, "lib/images/spicy_pizza.png", 'Dominos'],
    ['Hawaiian', '160', Colors.green, "lib/images/hawaii_pizza.png", 'Pizza Hut'],
    ['Mushroom', '170', Colors.yellow, "lib/images/mushrom_pizza.png", 'Little Caesars'],
    ['Meat', '200', Colors.brown, "lib/images/meat_pizza.png", 'Papa Johns'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pizzaOnSale.length, 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index){
        return DonutTile(
          donutFlavor: pizzaOnSale[index][0],
          donutPrice: pizzaOnSale[index][1],
          donutColor: pizzaOnSale[index][2],
          donutImagePath: pizzaOnSale[index][3],
          donutProvider: pizzaOnSale[index][4],
        );
      },
    );
  }
}