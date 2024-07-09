import 'package:flutter/material.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

import '../resources/auth_methods.dart';
import '../utils/colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthMethods _authMethods = AuthMethods();
  final TextEditingController emailAddress = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailAddress.addListener(_validateEmail);
  }

  @override
  void dispose() {
    emailAddress.removeListener(_validateEmail);
    emailAddress.dispose();
    super.dispose();
  }

  void _validateEmail() {
    setState(() {
      _isButtonEnabled = emailAddress.text.isNotEmpty;
    });
  }

  void onPressed() async {
    if (_isButtonEnabled) {
      bool res = await _authMethods.resetPassword(context, emailAddress);
      if (res) {
        Navigator.popAndPushNamed(context, '/sign-in');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
          'Forgot password',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  horizontal:
                      BorderSide(color: Color.fromRGBO(70, 70, 70, 1.0)),
                ),
              ),
              child: TextField(
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
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Continue',
              onPressed: _isButtonEnabled ? onPressed : () {},
              color: _isButtonEnabled ? buttonColor : secondaryBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
