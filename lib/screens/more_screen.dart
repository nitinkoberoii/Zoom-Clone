import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/settings_screens/accessibility_settings_screen.dart';
import 'package:zoom_clone/screens/settings_screens/meetings_settings_screen.dart';

import '../resources/auth_methods.dart';
import '../utils/colors.dart';
import '../widgets/custom_button.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
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
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 40,
        title: const Text(
          'More',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(thickness: 2),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 14.0),
              child: Text(
                'Added Features',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(thickness: 2),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(18, 0, 0, 4),
              child: Column(
                children: [
                  _buildListTile(
                    context,
                    icon: Icons.tab,
                    title: 'Whiteboards',
                  ),
                  _buildListTile(
                    context,
                    icon: CupertinoIcons.tickets,
                    title: 'Events',
                  ),
                  _buildListTile(
                    context,
                    icon: Icons.apps,
                    title: 'Apps',
                  ),
                  _buildListTile(
                    context,
                    icon: Icons.contact_page_outlined,
                    title: 'Contacts',
                  ),
                  _buildListTile(
                    context,
                    icon: Icons.video_collection_outlined,
                    title: 'Clips',
                  ),
                  _buildListTile(
                    context,
                    icon: Icons.note_alt_outlined,
                    title: 'Notes',
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(thickness: 2),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 14.0),
              child: Text(
                'SETTINGS',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(thickness: 2),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(18, 0, 0, 4),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MeetingsSettingsScreen())),
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
                  _buildListTile(
                    context,
                    icon: Icons.contact_page_outlined,
                    title: 'Contact requests',
                  ),
                  _buildListTile(
                    context,
                    icon: CupertinoIcons.chat_bubble_2,
                    title: 'Team chat',
                  ),
                  _buildListTile(
                    context,
                    icon: Icons.settings_outlined,
                    title: 'General',
                  ),
                  _buildListTile(
                    context,
                    icon: Icons.notifications_none,
                    title: 'Notifications',
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
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
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(thickness: 2),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 14.0),
              child: Text(
                'OTHER',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(thickness: 2),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(18, 0, 0, 4),
              child: Column(
                children: [
                  _buildListTile(
                    context,
                    icon: CupertinoIcons.qrcode_viewfinder,
                    title: 'Scan QR code',
                  ),
                  _buildListTile(
                    context,
                    icon: CupertinoIcons.info,
                    title: 'About',
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(thickness: 2),
            ),
            const SizedBox(height: 10),
            Center(
              child: CustomButton(
                text: 'Log Out',
                color: buttonColor,
                onPressed: () => AuthMethods().signOut(context),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(thickness: 2),
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required IconData icon, required String title, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ??
          () => showCupertinoDialog(
                context: context,
                builder: (context) =>
                    showAlertDialogBox('This function doesn\'t work 😔'),
              ),
      child: ListTile(
        leading: Icon(icon, size: 35),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}
