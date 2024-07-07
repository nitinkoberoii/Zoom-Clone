import 'package:flutter/material.dart';

import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

import '../widgets/custom_listTile.dart';

class JoinWithoutSignin extends StatefulWidget {
  const JoinWithoutSignin({super.key});

  @override
  State<JoinWithoutSignin> createState() => _JoinWithoutSigninState();
}

class _JoinWithoutSigninState extends State<JoinWithoutSignin> {
  late TextEditingController meetingIDController;
  late TextEditingController nameController;

  @override
  void initState() {
    meetingIDController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIDController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        toolbarHeight: 40,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const Text(
          'Join',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: secondaryBackgroundColor,
                border: Border.symmetric(
                  horizontal:
                      BorderSide(color: Color.fromRGBO(70, 70, 70, 1.0)),
                ),
              ),
              height: 40,
              child: TextField(
                controller: meetingIDController,
                cursorColor: Colors.lightBlue,
                maxLines: 1,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Meeting ID',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  'Join with a personal link name',
                  style: TextStyle(
                      color: buttonColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: secondaryBackgroundColor,
                border: Border.symmetric(
                  horizontal:
                      BorderSide(color: Color.fromRGBO(70, 70, 70, 1.0)),
                ),
              ),
              height: 40,
              child: TextField(
                controller: nameController,
                cursorColor: Colors.lightBlue,
                maxLines: 1,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Enter your name',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RichText(
                text: const TextSpan(
                  text: 'By clicking "Join", you agree to our ',
                  children: [
                    TextSpan(
                      text: 'Terms of Service ',
                      style: TextStyle(color: buttonColor),
                    ),
                    TextSpan(text: 'and '),
                    TextSpan(
                      text: 'Privacy Statement',
                      style: TextStyle(color: buttonColor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
                text: 'Join',
                onPressed: () {},
                color: secondaryBackgroundColor),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                  'If you received an invitation link, tap on the link to join the meeting'),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 14, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Join Options',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: secondaryBackgroundColor,
                border: Border.symmetric(
                  horizontal:
                      BorderSide(color: Color.fromRGBO(70, 70, 70, 1.0)),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: CustomListTile(
                        primaryText: 'Don\'t connect to audio',
                        secondaryText: ''),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(thickness: 2, height: 0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: CustomListTile(
                        primaryText: 'Turn off my video', secondaryText: ''),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}