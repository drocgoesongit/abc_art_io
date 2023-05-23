import 'package:flutter/material.dart';
import 'package:portfolio/views/web/project3.dart';

class Project3Widget extends StatelessWidget {
  const Project3Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/plain_bg.png"),
        fit: BoxFit.cover,
      )),
      child: Project3(
        width: MediaQuery.of(context).size.width / 12,
      ),
    );
  }
}
