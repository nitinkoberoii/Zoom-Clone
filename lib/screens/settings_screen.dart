import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/settings_screens/accessibility_settings_screen.dart';
import 'package:zoom_clone/screens/settings_screens/general_settings_screen.dart';
import 'package:zoom_clone/screens/settings_screens/meetings_settings_screen.dart';
import 'package:zoom_clone/utils/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          'More',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          children: [
            const Divider(thickness: 3),
            ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 35.0, vertical: 14.0),
                  child: Text(
                    'SETTINGS',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(thickness: 2),
                Container(
                  margin: const EdgeInsets.fromLTRB(18, 0, 0, 4),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MeetingsSettingsScreen())),
                        child: const ListTile(
                          leading: Icon(CupertinoIcons.videocam, size: 35),
                          title: Text(
                            'Meetings',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 18),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const GeneralSettingsScreen())),
                        child: const ListTile(
                          leading: Icon(Icons.settings_outlined, size: 35),
                          title: Text(
                            'General',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 18),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AccessibilitySettingsScreen())),
                        child: const ListTile(
                          leading: Icon(Icons.accessibility, size: 35),
                          title: Text(
                            'Accessibility',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 18),
                        ),
                      ),
                      InkWell(
                        onTap: () => showCupertinoDialog(
                          context: context,
                          builder: (context) => showAlertDialogBox(
                              'This function doesn\'t work 😔'),
                        ),
                        child: const ListTile(
                          leading: Icon(Icons.meeting_room_outlined, size: 35),
                          title: Text(
                            'Activation code login',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 20, color: secondaryBackgroundColor),
                Column(
                  children: [
                    InkWell(
                      onTap: () => showCupertinoDialog(
                        context: context,
                        builder: (context) =>
                            showAlertDialogBox('Zoom-Clone is up to date 😀'),
                      ),
                      child: const ListTile(
                        title: Row(
                          children: [
                            Text(
                              'Version',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Spacer(flex: 1),
                            Text(
                              '(v1.0.0)',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 2, height: 0),
                    ),
                    InkWell(
                      onTap: () => showCupertinoDialog(
                        context: context,
                        builder: (context) => showAlertDialogBox(
                            'Tell others about Zoom-Clone 🗣️'),
                      ),
                      child: const ListTile(
                        title: Text(
                          'Tell others about Zoom-Clone',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 2, height: 0),
                    ),
                    InkWell(
                      onTap: () => showCupertinoDialog(
                        context: context,
                        builder: (context) =>
                            showAlertDialogBox('Star Zoom-Clone on GitHub ⭐'),
                      ),
                      child: const ListTile(
                        title: Text(
                          'Star Zoom-Clone on GitHub',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 2, height: 0),
                    ),
                    InkWell(
                      onTap: () => showCupertinoDialog(
                        context: context,
                        builder: (context) =>
                            showAlertDialogBox('No Privacy Policy 📖'),
                      ),
                      child: const ListTile(
                        title: Text(
                          'Privacy Policy',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 2, height: 0),
                    ),
                    InkWell(
                      onTap: () => showCupertinoDialog(
                        context: context,
                        builder: (context) =>
                            showAlertDialogBox('No Terms of Service 💬'),
                      ),
                      child: const ListTile(
                        title: Text(
                          'Terms of Service',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 2, height: 0),
                    ),
                    InkWell(
                      onTap: () => showCupertinoDialog(
                        context: context,
                        builder: (context) => showAlertDialogBox(
                            'No Community Standards 🏴󠁥󠁳󠁭󠁤󠁿'),
                      ),
                      child: const ListTile(
                        title: Text(
                          'Community Standards',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 2, height: 0),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => showCupertinoDialog(
                    context: context,
                    builder: (context) => showAlertDialogBox(
                        'Create Pull Request on GitHub👇 to add any features or functionality'),
                  ),
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: secondaryBackgroundColor,
                    ),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Text(
                            'Open source software',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: buttonColor),
                          ),
                        ),
                        Icon(Icons.open_in_new, color: buttonColor),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    'NoCopyright@2k24 - nitinkoberoii @ GitHub. No rights reserved.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
