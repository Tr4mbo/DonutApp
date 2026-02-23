import 'package:donut_app/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
   SmoothieTab({super.key});

  // Lista de smoothies
  final List smoothieOnSale = [
    ['Tropical', '65', Colors.orange, "lib/images/tropical_smoothie.png", 'Tropical'],
    ['Berry', '70', Colors.purple, "lib/images/berry_smoothie.png", 'Jamba Juice'],
    ['Green', '75', Colors.green, "lib/images/green_smoothie.png", 'Nutrisa'],
    ['Banana', '60', Colors.yellow, "lib/images/banana_smothie.png", 'Starbucks'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: smoothieOnSale.length, 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index){
        return DonutTile(
          donutFlavor: smoothieOnSale[index][0],
          donutPrice: smoothieOnSale[index][1],
          donutColor: smoothieOnSale[index][2],
          donutImagePath: smoothieOnSale[index][3],
          donutProvider: smoothieOnSale[index][4],
        );
      },
    );
  }
}