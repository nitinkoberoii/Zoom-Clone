import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class MeetingOption extends StatefulWidget {
  final String text;
  bool isON;
  final Function(bool) onChange;

  MeetingOption({
    super.key,
    required this.text,
    this.isON = false,
    required this.onChange,
  });

  @override
  State<MeetingOption> createState() => _MeetingOptionState();
}

class _MeetingOptionState extends State<MeetingOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          CupertinoSwitch(
            value: widget.isON,
            onChanged: (bool value) {
              setState(() {
                widget.isON = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
