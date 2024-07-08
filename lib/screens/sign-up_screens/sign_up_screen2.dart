import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/auth_methods.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({super.key});

  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  final AuthMethods _authMethods = AuthMethods();
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();

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
          'Sign up',
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
            child: Column(
              children: [
                TextField(
                  controller: emailAddress,
                  cursorColor: Colors.lightBlue,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
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
                TextField(
                  controller: name,
                  cursorColor: Colors.lightBlue,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Name',
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                TextField(
                  controller: password,
                  cursorColor: Colors.lightBlue,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
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
          const SizedBox(height: 20),
          CustomButton(
            text: 'Continue',
            onPressed: () async {
              bool res = await _authMethods.signupWithEmailAndPassword(
                  context, emailAddress, name, password);
              if (res) {
                Navigator.pushNamed(context, '/home');
              }
            },
            color: secondaryBackgroundColor,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RichText(
              text: const TextSpan(
                text: 'By proceeding, I agree to the ',
                style: TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                    text: 'Zoom-Clone\'s Privacy Statement ',
                    style: TextStyle(color: buttonColor),
                  ),
                  TextSpan(text: 'and '),
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(color: buttonColor),
                  ),
                  TextSpan(text: '.'),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 30, 0, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Or select your sign up method',
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
