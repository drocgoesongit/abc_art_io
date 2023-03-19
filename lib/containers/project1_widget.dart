import 'package:flutter/material.dart';

import '../projects.dart';

class Project1Widget extends StatelessWidget {
  const Project1Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  // Projects Container..
      Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/plain_bg.png"),
              fit: BoxFit.cover,
            )
        ),
        child: Projects(width: MediaQuery.of(context).size.width/12,),
      );
  }
}

