import 'package:e_commerce_mini_app/Providers/authProvider.dart';
import 'package:e_commerce_mini_app/Screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Core/constants.dart';
import '../Core/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'E-Commerce\nMini App',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: green,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  validator: Validators.emailValidator,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: grey,
                    ),
                    labelText: "Email",
                    hintText: 'Enter Your Email',
                    labelStyle: labelTextStyle,
                    hintStyle: hintTextStyle,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  obscureText: isPasswordVisible,
                  validator: Validators.passwordValidator,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.password,
                      color: grey,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(!isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    labelText: "Password",
                    hintText: 'Enter Your Password',
                    labelStyle: labelTextStyle,
                    hintStyle: hintTextStyle,
                  ),
                ),
                const SizedBox(height: 10),
                Consumer<AuthProvider>(builder: (context, auth, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        await auth.login(emailController.text.toString(),
                            passwordController.text.toString());
                        if (auth.isAuthenticated) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: buttonColor,
                    ),
                    child: auth.isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
