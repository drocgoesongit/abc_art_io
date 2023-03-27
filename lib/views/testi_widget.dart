import 'package:flutter/material.dart';
import 'package:portfolio/utils/web/testimonials.dart';

class TestimonialWidget extends StatelessWidget {
  const TestimonialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/plain_bg.png"),
        fit: BoxFit.cover,
      )),
      child: Testimonials(
        width: MediaQuery.of(context).size.width / 12,
      ),
    );
  }
}
