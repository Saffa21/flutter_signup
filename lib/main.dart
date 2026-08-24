import 'package:flutter/material.dart';
import 'screens/shop_screen.dart'; 

void main() {
  runApp(GroceryApp());
}

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Groceries App',
      theme: ThemeData(
        primarySwatch: Colors.green, 
      ),
      home: ShopScreen(), 
    );
  }
}