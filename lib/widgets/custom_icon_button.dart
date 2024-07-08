import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_clone/utils/colors.dart';

class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onTap;

  const CustomIconButton({
    super.key,
    required this.iconPath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: secondaryBackgroundColor,
        border: Border.all(
          color: const Color.fromRGBO(70, 70, 70, 1.0),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(18)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20,
            ),
            Text(
              'Continue with $text',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(width: 1),
          ],
        ),
      ),
    );
  }
}

// ElevatedButton.icon(
// style: ButtonStyle(
// shape: WidgetStateProperty.all(
// RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
// ),
// backgroundColor: WidgetStateProperty.all(secondaryBackgroundColor),
// minimumSize: WidgetStateProperty.all(const Size(250, 50)),
// side: WidgetStateProperty.all(
// BorderSide(color: Color.fromRGBO(70, 70, 70, 1.0))),
// ),
// icon: Align(
// alignment: Alignment.centerLeft,
// child: SvgPicture.asset(
// 'assets/svgs/google.svg',
// width: 20,
// ),
// ),
// onPressed: () {},
// label: const Text('Continue with Google'),
// ),
