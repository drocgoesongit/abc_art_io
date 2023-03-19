import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class Projects extends StatelessWidget {
  Projects({required this.width});

  double width;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(width/3),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Image.asset('assets/images/ecom_mockup.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(left: width/2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                              "Android App",
                            style: kYellowSmallHeading,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "FOOTBALL\nECOM APP",
                            style: kTextStyleWhite,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "This is complete ecommerce application. It facilitates sales of all football accessories, football. Features like suggestions, history tracking, order tracking. And it also has separate application for admin to control and manage products of the store.",
                            style: kButtonText,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "Tech stack used",
                            style: kButtonText,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // row of images of tech stack used.
                          Row(
                            children: [
                              SizedBox(
                                height: 100,
                                  child: Image.asset('assets/images/java_icon.png',)
                              ),
                              SizedBox(
                                height: 100,
                                child: Image.asset('assets/images/kotlin_icon.png',),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
