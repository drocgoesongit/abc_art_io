import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';


class Project2 extends StatelessWidget {
  Project2({required this.width});

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
                            "FASK -\nRESTAURANT APP",
                            style: kTextStyleWhite,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Custom application for your restaurant that allows user to order food quickly without any middle man. Complete order and payment without any service charges. Beautiful and simple UI that pleases eyes and has excellent user experience.",
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
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(width/3),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Image.asset('assets/images/ecom_image.png'),
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
