import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({super.key});

  @override
  State<SignUpScreen1> createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  final TextEditingController _birthYearController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _birthYearController.addListener(_validateInput);
  }

  @override
  void dispose() {
    _birthYearController.removeListener(_validateInput);
    _birthYearController.dispose();
    super.dispose();
  }

  void _validateInput() {
    setState(() {
      if (_birthYearController.text.isNotEmpty &&
          _birthYearController.text.length == 4) {
        _isButtonEnabled = true;
      }
    });
  }

  void _onContinue() {
    if (_isButtonEnabled) {
      Navigator.pushNamed(context, '/sign-up/auth');
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
          'Sign up',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 0, 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Verify your age',
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
            height: 50,
            child: TextField(
              controller: _birthYearController,
              cursorColor: Colors.lightBlue,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Birth year',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 8),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Text(
              'Please confirm your birth year. This data will not be stored',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          CustomButton(
            text: 'Continue',
            onPressed: _isButtonEnabled ? _onContinue : () {},
            color: _isButtonEnabled ? buttonColor : secondaryBackgroundColor,
          ),
        ],
      ),
    );
  }
}
