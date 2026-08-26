import 'package:flutter/material.dart';
import 'screens/shop_screen.dart';       // 🟢 شاشة المتجر
import 'screens/account_screen.dart';   // 🟢 شاشة الحساب
import 'screens/product_detail_screen.dart'; // 🟢 شاشة تفاصيل المنتج

void main() {
  runApp(GroceryApp());
}

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // يخفي شعار debug
      title: 'Groceries App',
      theme: ThemeData(
        primarySwatch: Colors.green, // اللون الأساسي للتطبيق
      ),
      home: ShopScreen(), // 🟢 يبدأ من شاشة المتجر
    );
  }
}
