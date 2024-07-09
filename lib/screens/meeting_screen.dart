import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';

import '../utils/colors.dart';
import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

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

    void showBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Text(
                      'Personal meeting ID',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'XXX XXX XXXX',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: secondaryBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => showCupertinoDialog(
                          context: context,
                          builder: (context) => showAlertDialogBox(
                              'This function doesn\'t work 😔'),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Start meeting',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.calendar_today_outlined),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),
                      InkWell(
                        onTap: () => showCupertinoDialog(
                          context: context,
                          builder: (context) => showAlertDialogBox(
                              'This function doesn\'t work 😔'),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Send invitation',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.send_outlined),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),
                      InkWell(
                        onTap: () => showCupertinoDialog(
                          context: context,
                          builder: (context) => showAlertDialogBox(
                              'This function doesn\'t work 😔'),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Edit meeting',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.edit),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
        },
        backgroundColor: backgroundColor,
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: const Text(
          'Meetings',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: GestureDetector(
              onTap: showBottomSheet,
              child: const Icon(
                CupertinoIcons.info,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeMeetingButton(
                    onPressed: createNewMeeting,
                    text: 'New meeting',
                    icon: Icons.videocam,
                    color: Colors.deepOrange,
                  ),
                  HomeMeetingButton(
                    onPressed: () => joinMeeting(context),
                    text: 'Join',
                    icon: Icons.add_box_rounded,
                    color: buttonColor,
                  ),
                  HomeMeetingButton(
                    onPressed: () {},
                    text: 'Schedule',
                    icon: Icons.calendar_today,
                    color: buttonColor,
                  ),
                  HomeMeetingButton(
                    onPressed: () {},
                    text: 'Share screen',
                    icon: Icons.arrow_upward_rounded,
                    color: buttonColor,
                  ),
                ],
              ),
            ),
            const Divider(thickness: 2),
          ],
        ),
      ),
    );
    ;
  }
}
