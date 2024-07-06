import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomListTile extends StatefulWidget {
  final String primaryText;
  final String secondaryText;
  bool isON;

  CustomListTile({
    super.key,
    required this.primaryText,
    required this.secondaryText,
    this.isON = false,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.primaryText,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Spacer(flex: 1),
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
        const SizedBox(height: 8),
        if (widget.secondaryText != null && widget.secondaryText!.isNotEmpty)
          Text(
            widget.secondaryText,
            style: const TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
          )
      ],
    );
  }
}
