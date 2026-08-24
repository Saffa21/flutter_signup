import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0), // من Figma
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 26,
                height: 29 / 26,
                color: Color(0xFF181725),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Enter your credentials to continue",
              style: TextStyle(
                fontFamily: "Gilroy-Medium",
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF7C7C7C),
              ),
            ),
            SizedBox(height: 20),
            Text("Username",
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF7C7C7C),
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Afsar Hossen Shuvo",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Email",
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF7C7C7C),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "imshuvo97@gmail.com",
                suffixIcon: Icon(Icons.check_circle, color: Color(0xFF53B175)), // صح أخضر من Figma
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Password",
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 16,
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
            Text(
              "By continuing you agree to our Terms of Service and Privacy Policy",
              style: TextStyle(
                fontFamily: "Gilroy-Medium",
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF7C7C7C),
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "Sign Up",
              onPressed: () {
                // هنا تكتبي التنقل للصفحة التالية
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF7C7C7C),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // يرجع لصفحة Login
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xFF53B175), // أخضر من Figma
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
