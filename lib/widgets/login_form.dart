import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0), // من Figma
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter your emails and password",
            style: TextStyle(
              fontFamily: "Gilroy-Medium",
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 15 / 16,
              color: Color(0xFF7C7C7C),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Email",
            style: TextStyle(
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 29 / 16,
              color: Color(0xFF7C7C7C),
            ),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "imshuvo97@gmail.com",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFE2E2E2)),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Password",
            style: TextStyle(
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 29 / 16,
              color: Color(0xFF7C7C7C),
            ),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "••••••••",
              suffixIcon: Icon(Icons.visibility, color: Color(0xFF7C7C7C)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFE2E2E2)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                fontFamily: "Gilroy-Medium",
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF181725),
              ),
            ),
          ),
          SizedBox(height: 20),
          CustomButton(
            text: "Log In",
            onPressed: () {
              // هنا تكتبي التنقل للصفحة التالية
            },
          ),
        ],
      ),
    );
  }
}
