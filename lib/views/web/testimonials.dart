import 'package:flutter/material.dart';
import 'package:portfolio/const/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Testimonials extends StatelessWidget {
  Testimonials({required this.width});

  double width;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: width / 2),
              child: const Text(
                "Testimonials",
                style: kTitleTextBlack,
              ),
            ),
            const SizedBox(
              width: double.infinity,
            ),
            const Text(
              'Some lovely comments from my clientele.',
              style: kButtonText,
            ),
            const Expanded(
              child: Text(""),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: IndividualTestimonials(
                    width: width,
                    testimonial:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                    name: "Alexander Olsen",
                    profession: "Software Developer",
                    image: "assets/images/kotlin_icon.png",
                  )),
                  SizedBox(
                    width: width / 3,
                  ),
                  Expanded(
                    child: IndividualTestimonials(
                      width: width,
                      testimonial:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      name: "David Laid",
                      profession: "Product Manager",
                      image: "assets/images/flutter_icon.png",
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

class IndividualTestimonials extends StatelessWidget {
  IndividualTestimonials(
      {required this.width,
      required this.testimonial,
      required this.name,
      required this.profession,
      required this.image});
  double width;
  String testimonial;
  String name;
  String profession;
  String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width,
          height: width * 2,
          child: SvgPicture.asset('assets/images/quote.svg'),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          testimonial,
          style: kButtonText,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              height: 70,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: kSubBoldWhiteTitle,
                ),
                Text(
                  profession,
                  style: kButtonText,
                )
              ],
            )
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: width / 2))
      ],
    );
  }
}
