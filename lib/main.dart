import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:donut_app/screens/home_page.dart'; 
import 'package:donut_app/models/cart_model.dart'; 

void main() {
  runApp(
    // Con esto le damos el estado del carrito a toda la app
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 2. SOLUCIÓN: Dejamos un solo método build con tu configuración original
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(), 
    );
  }
}



