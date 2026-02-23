import 'package:donut_app/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PancakeTab extends StatelessWidget {
   PancakeTab({super.key});

  // Lista de pancakes
  final List pancakeOnSale = [
    ['Classic', '80', Colors.orange, "lib/images/classic_pancake.png", 'IHOP'],
    ['Berry', '95', Colors.purple, "lib/images/berry_pancake.png", 'Dennys'],
    ['Choco', '90', Colors.brown, "lib/images/choco_pancake.png", 'Vips'],
    ['Butter', '75', Colors.yellow, "lib/images/butter_pancake.png", 'Toks'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pancakeOnSale.length, 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 1 / 1.4,
      ),
      itemBuilder: (context, index){
        return DonutTile(
          donutFlavor: pancakeOnSale[index][0],
          donutPrice: pancakeOnSale[index][1],
          donutColor: pancakeOnSale[index][2],
          donutImagePath: pancakeOnSale[index][3],
          donutProvider: pancakeOnSale[index][4],
        );
      },
    );
  }
}