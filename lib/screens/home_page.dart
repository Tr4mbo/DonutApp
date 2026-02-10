import 'package:donut_app/tab/burger_tab.dart' show BurgerTab;
import 'package:donut_app/tab/donut_tab.dart';
import 'package:donut_app/tab/smoothie_tab.dart';
import 'package:flutter/material.dart';
import '../tab/pancakes_tab.dart';
import '../tab/pizza_tab.dart';
import '../utils/my_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TabController _tabController;
  // Código agregado: Lista de pestañas
  List<Widget> myTabs = const [
    MyTab(iconPath: 'lib/icons/donut.png', iconName: 'Donut'),
    MyTab(iconPath: 'lib/icons/burger.png', iconName: 'Burger'),
    MyTab(iconPath: 'lib/icons/smoothie.png', iconName: 'Smoothie'),
    MyTab(iconPath: 'lib/icons/pancakes.png', iconName: 'Pancake'),
    MyTab(iconPath: 'lib/icons/pizza.png', iconName: 'Pizza'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: Colors.transparent, 
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person, color: Colors.grey[800]),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text("I want to ", style: TextStyle(fontSize: 24)),
                  Text(
                    "Eat",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            
            // Corrección: Se pasa la lista myTabs
            TabBar(tabs: myTabs),
            
            //Contenido (Tabvar View)
            Expanded(
              child: TabBarView (
                controller: _tabController,
                children: [
                  DonutTab(),
                  BurgerTab(),
                  SmoothieTab(),
                  PancakesTab(),
                  PizzaTab(),
                ],
              ))
          ],
        ),
      ),
    );
  }
}