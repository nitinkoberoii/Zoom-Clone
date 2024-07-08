import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/widgets/custom_icon_button.dart';

import '../resources/auth_methods.dart';
import '../utils/colors.dart';
import '../widgets/custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    CupertinoAlertDialog showAlertDialogBox(String text) {
      return CupertinoAlertDialog(
        title: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Ok',
              style: TextStyle(fontSize: 16, color: buttonColor),
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        toolbarHeight: 40,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          'Sign in',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 0, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter your email address',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(color: Color.fromRGBO(70, 70, 70, 1.0)),
              ),
            ),
            child: const Column(
              children: [
                const TextField(
                  cursorColor: Colors.lightBlue,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Email',
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                const TextField(
                  cursorColor: Colors.lightBlue,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Password',
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: 'Sign In',
            onPressed: () {},
            color: secondaryBackgroundColor,
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 40, 0, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Other sign in methods',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(165, 164, 199, 1.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          CustomIconButton(
            iconPath: 'assets/svgs/google.svg',
            text: 'Google',
            onTap: () async {
              bool res = await _authMethods.signInWithGoogle(context);
              if (res) {
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
          const SizedBox(height: 10),
          CustomIconButton(
            iconPath: 'assets/svgs/apple.svg',
            text: 'Apple',
            onTap: () => showCupertinoDialog(
              context: context,
              builder: (context) => showAlertDialogBox(
                  'At the moment, the preferable solution is blocked by some issue. 😔 \nVisit this site for more info: https://firebase.flutter.dev/docs/auth/social'),
            ),
          ),
          const SizedBox(height: 10),
          CustomIconButton(
            iconPath: 'assets/svgs/facebook.svg',
            text: 'Facebook',
            onTap: () => showCupertinoDialog(
              context: context,
              builder: (context) => showAlertDialogBox(
                  'As I don\'t have an FB account, I couldn\'t create this feature. 😔 \nTo add this functionality, Visit this site for more info: https://firebase.flutter.dev/docs/auth/social'),
            ),
          ),
          const SizedBox(height: 10),
          CustomIconButton(
            iconPath: 'assets/svgs/key.svg',
            text: 'SSO',
            onTap: () => showCupertinoDialog(
              context: context,
              builder: (context) => showAlertDialogBox(
                  'To continue with SSO, you will require a company domain (e.g., "<company_name>.zoom.us")'),
            ),
          ),
        ],
      ),
    );
  }
}
