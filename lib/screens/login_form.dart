import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import 'signup_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 30),
          CustomTextField(
            label: "Email",
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) return "Email required";
              if (!value.contains("@")) return "Enter valid email";
              return null;
            },
          ),
          const SizedBox(height: 30),
          CustomTextField(
            label: "Password",
            obscure: true,
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) return "Password required";
              if (value.length < 8) return "Password must be at least 8 chars";
              return null;
            },
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text("Forgot Password?", style: TextStyle(color: Color(0xff181725))),
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              if (formKey.currentState!.validate()) {
                debugPrint("Login successful");
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: const Color(0xff53B175),
              ),
              child: const Center(
                child: Text("Log In",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account? ", style: TextStyle(fontWeight: FontWeight.w600)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpScreen()));
                },
                child: const Text("Signup",
                    style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xff53B175))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
