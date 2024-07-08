import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';

import '../utils/colors.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: const Text(
          'History',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
          stream: FirestoreMethods().meetingHistory,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: secondaryBackgroundColor),
              child: ListView.builder(
                itemCount: (snapshot.data! as dynamic).docs.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      title: Text(
                          'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}'),
                      subtitle: Text(
                          'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}'),
                    ),
                    const Divider(height: 2),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
