import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:zoom_clone/widgets/custom_listTile.dart';

import '../../utils/colors.dart';

class MeetingsSettingsScreen extends StatefulWidget {
  const MeetingsSettingsScreen({super.key});

  @override
  State<MeetingsSettingsScreen> createState() => _MeetingsSettingsScreenState();
}

class _MeetingsSettingsScreenState extends State<MeetingsSettingsScreen> {
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
          'Meeting settings',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 0, 0),
            child: Text(
              'AUDIO',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: secondaryBackgroundColor,
              border: Border.symmetric(
                horizontal: BorderSide(color: Color.fromRGBO(70, 70, 70, 1.0)),
              ),
            ),
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    'Auto-connect to audio',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 18),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomListTile(
                      primaryText: 'Mute my microphone', secondaryText: ''),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomListTile(
                    primaryText: 'Use original audio',
                    secondaryText:
                        'This will allow you to enable or disable original sound in a meeting. \nOriginal sound will disable noise suppression',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 0, 0),
            child: Text(
              'VIDEO',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
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
                  child: CustomListTile(
                      primaryText: 'Turn off my video', secondaryText: ''),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomListTile(
                      primaryText: 'Mirror my video',
                      secondaryText: '',
                      isON: true),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomListTile(
                      primaryText: 'Show video preview',
                      secondaryText: '',
                      isON: true),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomListTile(
                      primaryText: 'HD video', secondaryText: ''),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomListTile(
                      primaryText: 'Picture in picture',
                      secondaryText: '',
                      isON: true),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                const ListTile(
                  title: Text(
                    'Aspect Ratio',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 0, 0),
            child: Text(
              'General',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
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
                  child: CustomListTile(
                      primaryText: 'Always show meeting controls',
                      secondaryText: ''),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomListTile(
                      primaryText: 'Show my connected time', secondaryText: ''),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomListTile(
                      primaryText: 'Show name when participants join',
                      secondaryText: ''),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomListTile(
                    primaryText: 'Show non-video participants',
                    secondaryText: '',
                    isON: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomListTile(
                    primaryText: 'Ask to confirm when leaving a meeting',
                    secondaryText: '',
                    isON: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomListTile(
                    primaryText: 'Safe driving mode',
                    secondaryText:
                        'Swipe right to disable video and audio when driving',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomListTile(
                    primaryText:
                        'Show user profile icon next to\nin-meeting chat messages',
                    secondaryText: '',
                    isON: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                const ListTile(
                  title: Text(
                    'Reaction skin tone',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 18),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(thickness: 2, height: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: CustomListTile(
                      primaryText: 'Auto-copy invite link', secondaryText: ''),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 0, 0),
            child: Text(
              'Meeting reminder',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: secondaryBackgroundColor,
              border: Border.symmetric(
                horizontal: BorderSide(color: Color.fromRGBO(70, 70, 70, 1.0)),
              ),
            ),
            child: const ListTile(
              title: Text(
                'Reaction skin tone',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 0, 0),
            child: Text(
              'CLOSED CAPTIONING',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: secondaryBackgroundColor,
              border: Border.symmetric(
                horizontal: BorderSide(color: Color.fromRGBO(70, 70, 70, 1.0)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: CustomListTile(
                  primaryText: 'Auto-copy invite link', secondaryText: ''),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
