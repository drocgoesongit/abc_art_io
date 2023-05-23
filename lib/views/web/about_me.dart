import 'package:flutter/material.dart';
import 'package:portfolio/const/constants.dart';

class AboutMe extends StatelessWidget {
  AboutMe({required this.width});

  double width;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(left: width, right: width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        decoration: (BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        )),
                        child: Image.asset('assets/images/software_images.png'),
                      ),
                    )),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Mobile App Developer",
                            style: kTitleTextBlack,
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              "I do native development as well as cross platform development. Product design disciplines, leading the design of digital products and crafting amazing user experiences.",
                              style: kDescriptiveTextWhite,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
