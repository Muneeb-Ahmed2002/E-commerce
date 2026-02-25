import 'package:e_commerce_mini_app/Core/constants.dart';
import 'package:e_commerce_mini_app/Providers/authProvider.dart';
import 'package:e_commerce_mini_app/Screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: buttonColor,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          auth.logout;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false);
        },
        child: Card(
          margin: const EdgeInsets.all(10),
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.logout,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
