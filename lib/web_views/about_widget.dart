import 'package:flutter/material.dart';

import '../about_me.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // AboutMe Container..
        Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/plain_bg.png"),
        fit: BoxFit.cover,
      )),
      height: MediaQuery.of(context).size.height,
      child: AboutMe(
        width: MediaQuery.of(context).size.width / 12,
      ),
    );
  }
}
