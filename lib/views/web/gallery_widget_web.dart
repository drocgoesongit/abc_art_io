import 'package:flutter/material.dart';
import 'package:portfolio/const/constants.dart';

class GalleryWidgetWeb extends StatelessWidget {
  const GalleryWidgetWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        // bright strip section
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 20,
          color: kMainAccentColor,
          child: Center(
            child: Text(
              "Explore our Gallery😍",
              style: kButtonText.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),

        // IMAGE PART
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 20,
              vertical: MediaQuery.of(context).size.height / 20),
          child: Image.asset("assets/images/photos_gallery.png"),
        ),
      ]),
    );
  }
}
