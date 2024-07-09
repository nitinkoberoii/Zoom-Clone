import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

import '../utils/colors.dart';

class MailScreen extends StatefulWidget {
  const MailScreen({super.key});

  @override
  State<MailScreen> createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _preLoadAssets();
  }

  Future<void> _preLoadAssets() async {
    await Future.delayed(const Duration(milliseconds: 1));
    await precacheImage(const AssetImage('assets/images/mail.png'), context);
    setState(() {
      _isLoading = false;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: const Text(
          'Mail',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: buttonColor))
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 5),
                  Image.asset('assets/images/mail.png', height: 275),
                  const Text(
                    'Welcome\nto Zoom-Clone Mail',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomButton(
                      text: 'Get Started',
                      onPressed: () => showCupertinoDialog(
                            context: context,
                            builder: (context) => showAlertDialogBox(
                                'This function doesn\'t work 😔'),
                          ),
                      color: buttonColor),
                  const SizedBox(height: 5),
                ],
              ),
            ),
    );
  }
}
