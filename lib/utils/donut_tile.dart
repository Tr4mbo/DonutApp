import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donut_app/models/cart_model.dart'; // Importamos el carrito

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final dynamic donutColor;
  final String donutImagePath;
  final String donutProvider;
  
  const DonutTile({super.key, required this.donutFlavor, required this.donutPrice, required this.donutColor, required this.donutImagePath, required this.donutProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        // AQUÍ AGREGAMOS LA FUNCIÓN DE CLIC
        onTap: () {
          Provider.of<CartModel>(context, listen: false).addItem(
            donutFlavor, donutPrice, donutImagePath, donutColor, donutProvider
          );
          // Opcional: un pequeño mensaje abajo para avisar que se agregó
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$donutFlavor añadido al carrito'), 
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.pink[400],
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: donutColor[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              //etiqueta del precio
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                      color: donutColor[200],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                      )
                    ),
                    child: Text('\$$donutPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: donutColor[800],
                    ),
                    ),
                  )
                ],
              ),
              //imagen del donut (usando Expanded para no desbordar)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 24),
                  child: Image.asset(donutImagePath),
                ),
              ),
              //nombre del donut
              Text(
                donutFlavor,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 4),
              //nombre del proveedor
              Text(
                donutProvider,
                style: TextStyle(
                  color:  Colors.grey[600]
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.favorite, color: Colors.pink[400]),
                    const Text("ADD", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}