import 'package:flutter/material.dart';
import 'package:portfolio/const/constants.dart';
import 'package:portfolio/views/mobile/create_art_mobile.dart';
import 'package:portfolio/views/web/image_section_web.dart';
import 'package:portfolio/screens/create_art.dart';
import 'package:portfolio/screens/gallery_widget.dart';

import '../../utils/on_hover_text_widget.dart';

class HomeWidgetWeb extends StatelessWidget {
  final Function toHome;
  final Function toAbout;
  final Function toService;
  final Function toProject;
  final Function toTestimonial;

  HomeWidgetWeb(
      {required this.toHome,
      required this.toAbout,
      required this.toService,
      required this.toProject,
      required this.toTestimonial});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          // Navbar starts =====================================================
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
                    style: kTitleTextBlack,
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
                    "Gallery",
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
                    "Pricing",
                    style: kButtonText,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 24,
                ),
                const Text(
                  "Inbox",
                  style: kButtonText,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 24,
                ),
                GestureDetector(
                  onTap: () {
                    toProject();
                  },
                  child: const Text(
                    "Faq/Support",
                    style: kButtonText,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 12,
                )
              ],
            )),
          ),
          // Navbar ends =======================================================

          // Hero section starts ===============================================
          // First half ========================================================
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
                        OnHoverText(
                          hoveringStyle: kTitleTextBlack.copyWith(
                              color: kMainAccentColor, fontSize: 40),
                          nonHoveringStyle:
                              kTitleTextBlack.copyWith(fontSize: 40),
                          child: const Text(
                            "Get amazing profile photos generated using AI",
                            style: kTitleTextBlack,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          "You set the theme, you describe how it looks - background, vibe, freshness, style. We deliver the best quality AI generated image",
                          style: kTextBlack20.copyWith(fontSize: 24.0),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        MaterialButton(
                          elevation: 5.0,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateArt()));
                          },
                          color: kBackgroundSubtleTealColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: kMainAccentColor, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text("Create now!",
                                style: kTextBlack20.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // another half of home page. ==================================
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 12),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width / 24),
                        color: Colors.transparent,
                        child: Image.asset("assets/images/hero_image.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          // another half ends
          // hero section ends =================================================
        ],
      ),
    );
  }
}
