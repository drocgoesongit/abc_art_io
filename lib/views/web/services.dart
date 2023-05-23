import 'package:flutter/material.dart';
import 'package:portfolio/const/constants.dart';

class Services extends StatelessWidget {
  Services({required this.width});

  double width;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Expanded(
            child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Services",
                    style: kBoldTextStyle,
                  ),
                  Text(
                    "My services include",
                    style: kTextStyle,
                  ),
                  Text("")
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(width / 2),
                child: Image.asset("assets/images/services_image.png"),
              ),
            )
          ],
        )),
      ),
    );
  }
}
