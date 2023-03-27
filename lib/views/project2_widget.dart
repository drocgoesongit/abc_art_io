import 'package:flutter/material.dart';
import 'package:portfolio/utils/web/project2.dart';

class Project2Widget extends StatelessWidget {
  const Project2Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/plain_bg.png"),
        fit: BoxFit.cover,
      )),
      child: Project2(
        width: MediaQuery.of(context).size.width / 12,
      ),
    );
  }
}
