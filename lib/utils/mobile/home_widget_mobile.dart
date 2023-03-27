import 'package:flutter/material.dart';
import 'package:portfolio/utils/mobile/create_art.dart';

import '../../const/constants.dart';
import '../web/image_section_web.dart';

class HomeWidgetMobile extends StatelessWidget {
  const HomeWidgetMobile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 12),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            Container(
              child: Center(
                  child: Row(
                children: [
                  const Text("abc.art", style: kTitleTextBlackMobile),
                  Expanded(child: Container()),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  )
                ],
              )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 12),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.height / 3,
                child: Image.asset("assets/images/hero_image.png"),
              ),
            ),
            const Text(
              "Get amazing profile photos generated using AI",
              style: kTitleTextBlackMobile,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "You set the theme, you describe how it looks - background, vibe, freshness, style. We deliver the best quality AI generated image",
              style: kTextBlack20.copyWith(fontSize: 16.0),
            ),
            const SizedBox(
              height: 35.0,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              child: MaterialButton(
                elevation: 5.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateArtWithPromptMobile()));
                },
                color: kBackgroundSubtleTealColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: const BorderSide(color: kMainAccentColor, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Create now!",
                      style: kTextBlack20.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
