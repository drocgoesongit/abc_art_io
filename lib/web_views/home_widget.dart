import 'package:flutter/material.dart';
import 'package:portfolio/const/constants.dart';

class HomeWidget extends StatelessWidget {
  final Function toHome;
  final Function toAbout;
  final Function toService;
  final Function toProject;
  final Function toTestimonial;

  HomeWidget(
      {required this.toHome,
      required this.toAbout,
      required this.toService,
      required this.toProject,
      required this.toTestimonial});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey("Home"),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/purple_bg.png"),
        fit: BoxFit.cover,
      )),
      height: MediaQuery.of(context).size.height,
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: 60,
              // color: Colors.transparent,
              child: Center(
                  child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 12),
                    child: const Text(
                      "Your Logo",
                      style: kSubBoldWhiteTitle,
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      toHome();
                    },
                    child: const Text(
                      "Home",
                      style: kButtonText,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      toAbout();
                    },
                    child: const Text(
                      "About",
                      style: kButtonText,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      toService();
                    },
                    child: const Text(
                      "Services",
                      style: kButtonText,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      toProject();
                    },
                    child: const Text(
                      "Projects",
                      style: kButtonText,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      toTestimonial();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 12),
                      child: const Text(
                        "Testimonials",
                        style: kButtonText,
                      ),
                    ),
                  ),
                ],
              )),
            ),
            Expanded(
              child: Row(
                children: [
                  // first half of home page.
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // hello i am nabeel - row.
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 2,
                                color: kNotWhiteColor,
                                width: 70,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                "Hello, I am Nabeel 👋",
                                style: kButtonText,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          const Text(
                            "App Dev enabling brands to flow with change in order to grow 🚀",
                            style: kTextStyleWhite,
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          MaterialButton(
                            height: 60,
                            elevation: 5.0,
                            onPressed: () {},
                            color: kDarkBlueAccentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text("Contact Me", style: kButtonText),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  // another half of home page.
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 12),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
