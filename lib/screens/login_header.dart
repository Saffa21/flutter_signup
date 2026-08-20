import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 28.42),
        Center(child: Image.asset("assets/images/carrot.png")),
        const SizedBox(height: 100.2),
        const Text(
          "Login",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Color(0xff181725),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          "Enter your email and password",
          style: TextStyle(fontSize: 16, color: Color(0xff7C7C7C)),
        ),
      ],
    );
  }
}
