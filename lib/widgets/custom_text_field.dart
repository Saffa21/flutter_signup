import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscure;
  final TextEditingController controller;
  final String? Function(String?) validator;

  const CustomTextField({
    super.key,
    required this.label,
    this.obscure = false,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: obscure
            ? const Icon(Icons.visibility_off_outlined, color: Color(0xff7C7C7C))
            : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE2E2E2)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff53B175)),
        ),
      ),
    );
  }
}
