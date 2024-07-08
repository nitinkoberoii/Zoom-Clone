import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';

class SignUpScreen1 extends StatelessWidget {
  const SignUpScreen1({super.key});

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
            child: const TextField(
              cursorColor: Colors.lightBlue,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
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
              onPressed: () => Navigator.pushNamed((context), '/sign-up/auth'),
              color: secondaryBackgroundColor),
        ],
      ),
    );
  }
}
