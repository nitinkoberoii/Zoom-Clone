import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: buttonColor,
      appBar: AppBar(
        backgroundColor: buttonColor,
        leading: GestureDetector(
          onTap: () => Navigator.pushNamed((context), '/settings'),
          child: const Icon(Icons.settings_outlined),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 20),
          const Text(
            'zoom',
            style: TextStyle(
              fontFamily: 'PlaywriteITTrad',
              fontSize: 70,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Get Started with your account',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Join a Meeting',
                  color: buttonColor,
                  onPressed: () => Navigator.pushNamed(
                      (context), '/join-meeting-without-signIn'),
                ),
                const SizedBox(height: 10),
                CustomButton(
                    text: 'Sign Up',
                    color: secondaryBackgroundColor,
                    onPressed: () {}),
                const SizedBox(height: 10),
                CustomButton(
                    text: 'Sign In',
                    color: secondaryBackgroundColor,
                    onPressed: () async {
                      bool res = await _authMethods.signInWithGoogle(context);
                      if (res) {
                        Navigator.pushNamed(context, '/home');
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
