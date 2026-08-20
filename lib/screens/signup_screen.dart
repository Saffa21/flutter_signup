import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 28.42),
                Center(child: Image.asset("assets/images/carrot.png")),
                const SizedBox(height: 60),
                const Text("Sign Up",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: Color(0xff181725))),
                const SizedBox(height: 15),
                const Text("Create your account",
                    style: TextStyle(fontSize: 16, color: Color(0xff7C7C7C))),
                const SizedBox(height: 30),
                CustomTextField(
                  label: "Name",
                  controller: nameController,
                  validator: (value) => value == null || value.isEmpty ? "Name required" : null,
                ),
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
                const SizedBox(height: 30),
                CustomTextField(
                  label: "Confirm Password",
                  obscure: true,
                  controller: confirmController,
                  validator: (value) {
                    if (value != passwordController.text) return "Passwords do not match";
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      debugPrint("Sign Up successful");
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: const Color(0xff53B175),
                    ),
                    child: const Center(
                      child: Text("Sign Up",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
