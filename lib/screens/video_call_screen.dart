import 'package:flutter/material.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';

import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/utils/colors.dart';

import '../widgets/custom_button.dart';
import '../widgets/meeting_options.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIDController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIDController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIDController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIDController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: backgroundColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          'Join',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          Container(
            decoration: const BoxDecoration(
              color: secondaryBackgroundColor,
              border: Border.symmetric(
                horizontal: BorderSide(color: Color.fromRGBO(70, 70, 70, 1.0)),
              ),
            ),
            height: 50,
            child: TextField(
              controller: meetingIDController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room ID',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: const BoxDecoration(
              color: secondaryBackgroundColor,
              border: Border.symmetric(
                horizontal: BorderSide(color: Color.fromRGBO(70, 70, 70, 1.0)),
              ),
            ),
            height: 50,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RichText(
              text: const TextSpan(
                text: 'By clicking "Join", you agree to our ',
                style: TextStyle(color: Colors.grey),
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
          const SizedBox(height: 10),
          CustomButton(
            text: 'Join',
            onPressed: _joinMeeting,
            color: secondaryBackgroundColor,
          ),
          const SizedBox(height: 20),
          Container(
            decoration: const BoxDecoration(
              color: secondaryBackgroundColor,
              border: Border.symmetric(
                horizontal: BorderSide(color: Color.fromRGBO(70, 70, 70, 1.0)),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: MeetingOption(
                    text: 'Turn Off my Audio',
                    isON: isAudioMuted,
                    onChange: onAudioMuted,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: MeetingOption(
                    text: 'Turn Off my Video',
                    isON: isVideoMuted,
                    onChange: onVideoMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onAudioMuted(bool value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  onVideoMuted(bool value) {
    setState(() {
      isVideoMuted = value;
    });
  }
}
