import 'package:flutter/material.dart';
import '../screens/signup_screen.dart';

class DontHaveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xFF7C7C7C),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
          },
          child: Text(
            "Signup",
            style: TextStyle(
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF53B175), // أخضر من Figma
            ),
          ),
        ),
      ],
    );
  }
}
