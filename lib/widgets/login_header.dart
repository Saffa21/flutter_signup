import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Login",
      style: TextStyle(
        fontSize: 30, // ← انسخي الحجم من Figma
        fontWeight: FontWeight.bold,
        color: Colors.black, // ← انسخي اللون من Figma
      ),
    );
  }
}
