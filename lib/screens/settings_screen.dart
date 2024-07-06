import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zoom_clone/utils/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        toolbarHeight: 40,
        leading: const Icon(Icons.arrow_back_ios_new),
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
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 35.0, vertical: 14.0),
                  child: Text(
                    'SETTINGS',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(thickness: 2),
                Container(
                  margin: const EdgeInsets.fromLTRB(18, 0, 0, 4),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(CupertinoIcons.videocam, size: 35),
                        title: const Text(
                          'Meetings',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: GestureDetector(
                            onTap: () {},
                            child:
                                const Icon(Icons.arrow_forward_ios, size: 18)),
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings_outlined, size: 35),
                        title: const Text(
                          'General',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: GestureDetector(
                            onTap: () {},
                            child:
                                const Icon(Icons.arrow_forward_ios, size: 18)),
                      ),
                      ListTile(
                        leading: const Icon(Icons.accessibility, size: 35),
                        title: const Text(
                          'Accessibility',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: GestureDetector(
                            onTap: () {},
                            child:
                                const Icon(Icons.arrow_forward_ios, size: 18)),
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.meeting_room_outlined, size: 35),
                        title: const Text(
                          'Activation code login',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: GestureDetector(
                            onTap: () {},
                            child:
                                const Icon(Icons.arrow_forward_ios, size: 18)),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 20),
                Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Version',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      trailing: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.arrow_forward_ios, size: 18)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 2, height: 0),
                    ),
                    ListTile(
                      title: const Text(
                        'Tell others about Zoom',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      trailing: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.arrow_forward_ios, size: 18)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 2, height: 0),
                    ),
                    ListTile(
                      title: const Text(
                        'Rate Zoom in the Google Play Store',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      trailing: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.arrow_forward_ios, size: 18)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 2, height: 0),
                    ),
                    ListTile(
                      title: const Text(
                        'Privacy Policy',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      trailing: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.arrow_forward_ios, size: 18)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 2, height: 0),
                    ),
                    ListTile(
                      title: const Text(
                        'Terms of Service',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      trailing: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.arrow_forward_ios, size: 18)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 2, height: 0),
                    ),
                    ListTile(
                      title: const Text(
                        'Community Standards',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      trailing: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.arrow_forward_ios, size: 18)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(thickness: 2, height: 0),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(74, 74, 74, 1),
                  ),
                  child: GestureDetector(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
