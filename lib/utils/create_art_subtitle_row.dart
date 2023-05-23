import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubtitleRow extends StatelessWidget {
  const SubtitleRow(
      {super.key,
      required this.title,
      required this.icon,
      required this.isOptional});
  final String title;
  final String icon;
  final bool isOptional;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 16,
          width: 16,
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        if (isOptional)
          const Text(
            ' (Optional)',
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Montserrat",
            ),
          ),
      ],
    );
  }
}
