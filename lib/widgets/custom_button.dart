import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF53B175), 
        minimumSize: Size(364, 67),          
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19), 
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Gilroy",
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Color(0xFFFFFFFF), 
        ),
      ),
    );
  }
}
