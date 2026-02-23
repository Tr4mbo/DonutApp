import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donut_app/models/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey[800], size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('My Cart', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(Icons.person, color: Colors.grey[800]),
          ),
        ],
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(
              child: Text(
                "Tu carrito está vacío", 
                style: TextStyle(fontSize: 18, color: Colors.grey[600])
              )
            );
          }
          return Column(
            children: [
              // Lista de productos en el carrito
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 10, spreadRadius: 1)
                        ]
                      ),
                      child: Row(
                        children: [
                          // Imagen del producto
                          Container(
                            height: 80,
                            width: 80,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: item.color[100],
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Image.asset(item.imagePath),
                          ),
                          const SizedBox(width: 16),
                          // Detalles del producto (Nombre, Proveedor, Precio)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                const SizedBox(height: 4),
                                Text(item.provider, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                                const SizedBox(height: 8),
                                Text('\$${item.price}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              ],
                            ),
                          ),
                          // Botones de + y -
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.add, size: 16),
                                  onPressed: () => cart.incrementQuantity(item),
                                  constraints: const BoxConstraints(minHeight: 30, minWidth: 30),
                                  padding: EdgeInsets.zero,
                                ),
                                Text('${item.quantity}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                IconButton(
                                  icon: const Icon(Icons.remove, size: 16),
                                  onPressed: () => cart.decrementQuantity(item),
                                  constraints: const BoxConstraints(minHeight: 30, minWidth: 30),
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Sección final: Total y botón de orden
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        Text('\$${cart.totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          // Aquí iría la lógica de pago a futuro
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[400],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Order Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}