import 'package:flutter/material.dart';
import 'package:portfolio/utils/web/footers.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/plain_bg.png"),
        fit: BoxFit.cover,
      )),
      child: Footer(),
    );
  }
}
