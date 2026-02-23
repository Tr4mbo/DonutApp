import 'package:donut_app/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
   BurgerTab({super.key});

  // Lista de hamburguesas
  final List burgerOnSale = [
    // burgerFlavor, burgerPrice, burgerColor, burgerImagePath, burgerProvider
    ['Classic', '120', Colors.orange, "lib/images/normal_hamburger.png", 'Burger King'],
    ['Chicken', '135', Colors.yellow, "lib/images/cocow_hamburger.png", 'KFC'],
    ['Bacon Egg', '145', Colors.red, "lib/images/bacon_hamburger.png", "Carl's Jr"],
    ['Fish', '110', Colors.blue, "lib/images/mojarra_hamburger.png", 'McDonalds'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: burgerOnSale.length, 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index){
        return DonutTile(
          donutFlavor: burgerOnSale[index][0],
          donutPrice: burgerOnSale[index][1],
          donutColor: burgerOnSale[index][2],
          donutImagePath: burgerOnSale[index][3],
          donutProvider: burgerOnSale[index][4],
        );
      },
    );
  }
}